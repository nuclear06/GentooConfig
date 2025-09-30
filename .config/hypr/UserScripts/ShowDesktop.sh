#!/bin/env sh

TMP_FILE="$XDG_RUNTIME_DIR/hyprland-show-desktop"

CURRENT_WORKSPACE=$(hyprctl monitors -j | jq -r '.[] | .activeWorkspace.name')

if [ -s "$TMP_FILE-$CURRENT_WORKSPACE" ]; then
  # --- Restore ---
  readarray -t ADDRESS_ARRAY < "$TMP_FILE-$CURRENT_WORKSPACE"

  FOCUSED="${ADDRESS_ARRAY[0]}"
  WINDOWS=("${ADDRESS_ARRAY[@]:1}")

  CMDS=""
  for address in "${WINDOWS[@]}"; do
    CMDS+="dispatch movetoworkspacesilent name:$CURRENT_WORKSPACE,address:$address;"
  done

  hyprctl --batch "$CMDS"

  # try to refocus old focused window
  if [ -n "$FOCUSED" ] && hyprctl clients -j | jq -e --arg addr "$FOCUSED" '.[] | select(.address == $addr)' >/dev/null; then
    hyprctl dispatch focuswindow address:"$FOCUSED"
  elif [ ${#WINDOWS[@]} -gt 0 ]; then
    # fallback to first restored window
    hyprctl dispatch focuswindow address:"${WINDOWS[0]}"
  fi

  rm "$TMP_FILE-$CURRENT_WORKSPACE"

else
  # --- Hide ---
  HIDDEN_WINDOWS=$(hyprctl clients -j | jq -r --arg CW "$CURRENT_WORKSPACE" \
    '.[] | select(.workspace.name == $CW) | .address')

  FOCUSED=$(hyprctl activewindow -j | jq -r '.address')

  TMP_ADDRESS="$FOCUSED"$'\n'
  CMDS=""

  while read -r address; do
    [ -n "$address" ] || continue
    TMP_ADDRESS+="$address"$'\n'
    CMDS+="dispatch movetoworkspacesilent special:desktop,address:$address;"
  done <<< "$HIDDEN_WINDOWS"

  hyprctl --batch "$CMDS"

  printf "%s" "$TMP_ADDRESS" > "$TMP_FILE-$CURRENT_WORKSPACE"
fi
