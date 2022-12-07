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
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.

nsrc () {
	nvim src/main* 2>/dev/null || nvim src/bin/main* 2>/dev/null || nvim src/
}

c () {
	tmp="$(exa -aa1D| fzf --reverse)"
	if [ $tmp ]; then
		cd $tmp
	fi
}

#export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[2 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[2 q"
}
zle -N zle-line-init
echo -ne '\e[2 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[2 q' ;} # Use beam shape cursor for each new prompt.


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

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

source $HOME/.local/bin/proj-jump.sh

bindkey '^e' edit-command-line

bindkey -s '^o' 'lfcd\n'

bindkey -s '^P' 'nvim /tmp/tmp.kalk\n'

bindkey -s '^Y' 'nvim /tmp/tmp.sbcli\n'

bindkey -s '^N' 'nvim .\n'

bindkey -s '^W' 'wiki\n'

bindkey -s '^k' 'pulsemixer\n'

# Prompt ZSH
autoload -U colors && colors
PS1="%B%{$fg[cyan]%}%~%{$fg[magenta]%} ❯ %{$reset_color%}%b"
PS2="%B%{$fg[magenta]%}❯ %{$reset_color%}%b"

alias Ex="nvim -c ':Ex'"
alias animemnt="sshfs player01@192.168.1.87:Videos/not-anime ~/Videos/remote -C"
alias bc="bc --mathlib"
alias block="betterlockscreen -l blur"
alias bluetooth="bluetoothctl"
alias cbonsair="cbonsai --seed 119"
alias codef="cd ~/Documents/code"
alias discordgpu="LIBVA_DRIVER_NAME=i915 discord --enable-gpu-rasterization &"
alias dwm-conf="cd ~/gitclone/suckless/dwm && nvim ~/gitclone/suckless/dwm/config.h"
alias fortnite="osu"
alias gbookmark="nvim ~/.local/share/bookmarks/bookmarks"
alias getweather="curl wttr.in/west+bloomfield+township\?m && cal && date"
alias hsetwall="hsetroot -cover ~/Pictures/wallpapers/wp.jpg"
alias l="exa -a1 --icons --sort=type"
alias lf="lfub"
alias lfwp="lfub ~/Pictures/wallpapers/"
alias locknow="loginctl suspend && betterlockscreen -l blur"
alias ls="exa -a --icons --sort=type"
alias mocp="ncmpcpp"
alias mongod="doas -u mongodb mongod --config /etc/mongodb.conf"
alias mupdf="devour mupdf"
alias n="nsxiv . -t"
alias nano="nvim"
alias newsboat="newsboat -u ~/.config/newsboat/urls"
alias norg="nvim ~/Documents/org/index.norg"
alias nshuf="fd --max-depth=1 --type=file --extension=webp --extension=jpg --extension=png --extension=jpeg --extension=gif | shuf | nsxiv -iat"
alias nshufa="fd --type=file --extension=webp --extension=jpg --extension=png --extension=jpeg --extension=gif | shuf | nsxiv -iat"
alias nsxiv="devour nsxiv"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias offnow="doas loginctl poweroff"
alias offon="doas loginctl reboot"
alias osu-dir="cd ~/.local/share/osu-wine/OSU/"
alias pm="pulsemixer"
alias poweroff="doas loginctl poweroff"
alias reboot="doas loginctl reboot"
alias rs="rsync -urvP"
alias sbcl="rlwrap sbcl --noinform --userinit $XDG_CONFIG_HOME/sbcl/sbclrc"
alias skool="cd ~/Documents/wiki/school/"
alias src="source ~/.config/zsh/.zshrc"
alias startx="startx $XINITRC"
alias sudo="doas"
alias svim="sudoedit"
alias todo="nvim ~/Documents/wiki/todo.wiki"
alias uncrustify="uncrustify -c ~/.config/uncrustify/uncrustify.cfg"
alias vi="nvim"
alias vim="nvim"
alias weather="curl wttr.in/West+Bloomfield+Township\?m\&format=2"
alias weather_report="curl wttr.in/West+Bloomfield+Township\?m"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias wiki="nvim ~/Documents/wiki/index.wiki"
alias xinitrc="nvim ~/.xinitrc"
alias xmon="xrandr --output HDMI-A-0 --primary --left-of eDP && sleep 1 && hsetroot -cover ~/Pictures/wallpapers/wp.jpg && krepeat"
alias xmonsame="xrandr --auto && xrandr --output HDMI-A-0 --same-as eDP && sleep 1 && hsetroot -cover ~/Pictures/wallpapers/wp.jpg && krepeat"
alias yt_mpv_360='mpv --ytdl-format=18 $1'
alias yt_mpv_720='mpv --ytdl-format=22 $1'
alias yta="yt-dlp -x --audio-format mp3"
alias zathura="devour zathura"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#. /usr/share/z/z.sh
eval "$(zoxide init zsh)"
source /home/bruh/.config/broot/launcher/bash/br
