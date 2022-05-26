export MOZ_ENABLE_WAYLAND=1

HISTFILE=~/.cache/zsh/history
HISTSIZE=500

SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/bruh/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#nsrc () {
#	nvim src/main* $(/usr/bin/ls -X src | tr '\n' ' ' | sed -e 's/ / src\//g' | sed -e 's/^/src\//' | sed -e 's/ src\/$//')
#}
nsrc () {
	nvim src/main* || nvim src/
}

c () {
	tmp="$(exa -aa1D| fzf --reverse)"
	if [ $tmp ]; then
		cd $tmp
	fi
}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^P' 'lazygit\n'

bindkey -s '^N' 'nvim -c "Telescope oldfiles"\n'

bindkey -s '^W' 'wiki\n'

# Prompt ZSH
autoload -U colors && colors
PS1="%B%{$fg[cyan]%}%~%{$fg[magenta]%} ❯ %{$reset_color%}%b"
PS2="%B%{$fg[magenta]%}❯ %{$reset_color%}%b"

alias bluetooth="bluetoothctl"
alias getweather="curl wttr.in/west+bloomfield+township/\?m && cal && date"
alias cbonsair="cbonsai --seed 119"
alias offon="doas loginctl reboot"
alias offnow="doas loginctl poweroff"
alias discordgpu="LIBVA_DRIVER_NAME=i915 discord --enable-gpu-rasterization &"
alias sudo="doas"
alias locknow="loginctl suspend && betterlockscreen -l blur"
alias block="betterlockscreen -l blur"
alias reboot="doas loginctl reboot"
alias poweroff="doas loginctl poweroff"
alias fortnite="osu"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias nano="nvim"
alias dwm-conf="cd ~/gitclone/suckless/dwm && nvim ~/gitclone/suckless/dwm/config.h"
alias osu-dir="cd ~/.local/share/osu-wine/OSU/"
alias skool="cd ~/Documents/vimwiki/school/"
alias xinitrc="nvim ~/.xinitrc"
alias codef="cd ~/Documents/code"
alias todo="nvim ~/Documents/wiki/todo.wiki"
alias vi="nvim"
alias l="exa -a1 --icons"
alias ls="exa -a --icons"
alias nsxiv="devour nsxiv"
alias mupdf="devour mupdf"
alias zathura="devour zathura"
alias n="nsxiv . -t"
alias newsboat="newsboat -u ~/.config/newsboat/urls"
alias mocp="ncmpcpp"
alias lf="lfub"
alias startx="startx $XINITRC"
alias wiki="nvim ~/Documents/wiki/index.wiki"
alias svim="sudoedit"
alias gbookmark="nvim ~/.local/share/bookmarks/bookmarks"
alias bc="bc --mathlib"
alias uncrustify="uncrustify -c ~/.config/uncrustify/uncrustify.cfg"
alias rs="rsync -urvP"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. /usr/share/z/z.sh
