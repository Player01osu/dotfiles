# Lines configured by zsh-newuser-install
### EXPORT
LC_ALL=C
export LC_ALL
export EDITOR="nvim"
export SHELL="zsh"
export PF_INFO="ascii title os kernel shell editor pkgs memory"
export PF_COL1=5
export PF_COL3=5
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
##export EDITOR="vim -t -a ''"              # $EDITOR use Emacs in terminal
##export VISUAL="vim -c -a vim"           # $VISUAL use Emacs in GUI mode

export WINEPREFIX="$HOME/.wine_osu" # This is the path to a hidden folder in your home folder.
export WINEARCH=win32 # Only needed when executing the first command with that WINEPREFIX

# Arch Linux/wine-osu users should uncomment next line
# to update PATH to make sure we're using the right Wine binary
export PATH=/opt/wine-osu/bin:~/.cargo/bin:$PATH



# zsh-autocomplete plugin

#zstyle ':autocomplete:*' min-delay 0.1  # float
# Wait this many seconds for typing to stop, before showing completions.

#zstyle ':autocomplete:*' min-input 1  # int
# Wait until this many characters have been typed, before showing completions.


#source ~/git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

HISTFILE=~/.histfile
HISTSIZE=500

SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bruh/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^P' 'lazygit\n'

bindkey -s '^N' 'nvim\n'

# Prompt ZSH
#autoload -Uz promptinit
#promptinit
#prompt walters
#PROMPT='%F{green}%n%f@%F{blue}%m%f %F{magenta}%B%~%b%f %# '
#RPROMPT='[%F{yellow}%?%f]'
autoload -U colors && colors
PS1="%B%{$fg[blue]%}[%{$fg[magenta]%}%n%{$fg[blue]%}@%{$fg[magenta]%}%M %{$fg[blue]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=054,underline"

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

alias bluetooth="bluetoothctl"
alias getweather="curl wttr.in\?m && cal && date"
alias cbonsair="cbonsai --seed 119"
alias offon="loginctl reboot"
alias offnow="loginctl poweroff"
alias discordgpu="LIBVA_DRIVER_NAME=i915 discord --enable-gpu-rasterization &"
alias sudo="doas"
alias locknow="loginctl suspend && betterlockscreen -l blur"
alias block="betterlockscreen -l blur"
alias reboot="loginctl reboot"
alias poweroff="loginctl poweroff"
alias fortnite="osu"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias dwm-conf="cd ~/gitclone/suckless/dwm-fork/ && nvim ~/gitclone/suckless/dwm-fork/config.def.h"
alias osu-dir="cd ~/.local/share/osu-wine/OSU/"
alias skool="cd ~/Documents/school/"
alias xinitrc="nvim ~/.xinitrc"
alias codef="cd ~/Documents/code"
alias todo="nvim ~/todo.md"
alias vi="nvim"
alias l="ls -Ao1v --color=auto"
alias ls="ls -Av --color=auto"
alias nsxiv="devour nsxiv"
alias mupdf="devour mupdf"
#neofetch
pfetch
#acpi





# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


