#!/bin/env sh
#!/bin/sh

# Find the hwmon device with name=k10temp (AMD CPU)
hwmon_dir=""
for d in /sys/class/hwmon/hwmon*; do
    if [ "$(cat "$d/name" 2>/dev/null)" = "k10temp" ]; then
        hwmon_dir="$d"
        break
    fi
done

if [ -n "$hwmon_dir" ] && [ -f "$hwmon_dir/temp1_input" ]; then
    temp=$(cat "$hwmon_dir/temp1_input")
    # Convert millidegree to degree Celsius
    echo $((temp / 1000))
else
    echo "0"
fi

