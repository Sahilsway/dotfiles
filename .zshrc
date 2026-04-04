zsh_theme="robbyrussell"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/sahil/.zshrc'

autoload -Uz compinit
compinit

### --- NVIDIA GPU
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __NV_PRIME_RENDER_OFFLOAD=1
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0

# External monitor aliases
alias hdmi-ext='xrandr --output HDMI-1 --mode 1920x1080 --rate 60 --right-of eDP-1 --auto'
alias hdmi-mirror='xrandr --output HDMI-1 --mode 1920x1080 --same-as eDP-1'
alias hdmi-only='xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --rate 60'
alias hdmi-off='xrandr --output HDMI-1 --off --output eDP-1 --auto'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# End of lines configured by zsh-newuser-install
export PATH="$HOME/.local/flutter/bin:$PATH"
eval "$(starship init zsh)"
