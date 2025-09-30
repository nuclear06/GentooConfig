# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="duellj"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    rsync
    aliases
    alias-finder
    docker
    docker-compose
    git
    dirhistory
    fancy-ctrl-z
    history
    qrcode
    zsh-autosuggestions
    autojump
    zsh-syntax-highlighting
    direnv
    uv
    extract
    systemd
)
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=4000
bindkey -e

alias l="eza --sort=changed -r -F -al --group-directories-first"
alias ll="eza --sort=changed -r -F -l --group-directories-first"
alias dis="dispatch-conf"
# fix alias after sudo
alias sudo='sudo '
alias sduo='sudo ' 
alias sodu='sudo '
alias sdu='sudo '
alias sud='sudo '

alias nv=nvim

alias f='sudo flaggie'
alias eq=equery
alias eg='sudo emerge'

alias cls=clear
alias lg=lazygit
allowtest() {
    sudo flaggie "$1" +~amd64
}

export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

# bindkey '\e[1~' beginning-of-line
# bindkey '\e[4~' end-of-line

export http_proxy=http://127.0.0.1:10808
export https_proxy=http://127.0.0.1:10808

export PATH="$PATH:/home/saniter/.local/bin"

#fcitx
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"
export XMODIFIERS="@im=fcitx"

export UV_DEFAULT_INDEX="https://mirrors.bfsu.edu.cn/pypi/web/simple"

