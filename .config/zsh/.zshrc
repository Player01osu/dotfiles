setopt autocd extendedglob nomatch
unsetopt beep
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
bindkey -e

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.

export GPG_TTY=$(tty)
export WAYLAND_DISPLAY='wayland-1'

c () {
	tmp="$(fd --max-depth 1 --hidden --follow --exclude ".git" --type=directory --no-ignore . | fzf)"
	if [ $tmp ]; then
		cd $tmp
	fi
}

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --max-depth 1 --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --max-depth 1 --type d --hidden --follow --exclude ".git" . "$1"
}

#export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

spotdl_pair () {
    if [ -z $2 ]; then
        echo 'Requires two arguments; (yt url) and (spotify url)'
        return 1
    fi
    spotdl download "${1}|${2}"
}

fzf-hist () {
    cmd=$(fzf --height 80% --tac < $HISTFILE)
    if [ -z $cmd ]; then; return 0; fi
    echo $cmd
    echo $cmd >> $HISTFILE
    zsh -c $cmd
}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^m' edit-command-line

source $HOME/.local/bin/proj-jump.sh

kalk () {
    nvim /tmp/tmp.kalk
}

skalk () {
    nvim /tmp/tmp.sbcli
}

# Prompt ZSH
autoload -U colors && colors
PS1="%B%{$fg[cyan]%}%~%{$fg[magenta]%} ❯ %{$reset_color%}%b"
PS2="%B%{$fg[magenta]%}❯ %{$reset_color%}%b"

alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias bc="bc --mathlib"
alias calibre=calibre --with-library "$XDG_DATA_HOME/Calibre Library"
alias cbonsair="cbonsai --seed 119"
alias choosenim="choosenim --choosenimDir:${XDG_DATA_HOME}/choosenim"
alias fortnite="osu"
alias getweather="curl wttr.in/west+bloomfield+township\?m && cal && date"
alias hsetwall="hsetroot -cover ~/Pictures/wallpapers/wp.jpg"
alias locknow="loginctl suspend && betterlockscreen -l blur"
alias man-keep="man -P 'less -X'"
alias mongod="doas -u mongodb mongod --config /etc/mongodb.conf"
alias n="nsxiv . -t"
alias newsboat="newsboat -u ~/.config/newsboat/urls"
alias nshuf="fd --max-depth=1 --type=file --extension=webp --extension=jpg --extension=png --extension=jpeg --extension=gif | shuf | nsxiv -iat"
alias nshufa="fd --type=file --extension=webp --extension=jpg --extension=png --extension=jpeg --extension=gif | shuf | nsxiv -iat"
alias octave="octave -q"
alias offnow="doas loginctl poweroff"
alias offon="doas loginctl reboot"
alias pm="pulsemixer"
alias poweroff="doas loginctl poweroff"
alias reboot="doas loginctl reboot"
alias sbcl="rlwrap sbcl --noinform --userinit $XDG_CONFIG_HOME/sbcl/sbclrc"
alias startx="startx $XINITRC"
alias weather="curl wttr.in/West+Bloomfield+Township\?m\&format=2"
alias weather_report="curl wttr.in/West+Bloomfield+Township\?m"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias mysql-workbench=mysql-workbench --configdir="$XDG_DATA_HOME/mysql/workbench"
alias f5fpc="HOME=${XDG_DATA_HOME} f5fpc"

source <(fzf --zsh)
[ -e '/usr/share/zsh/plugins/zsh-completion/completion.zsh' ] && source /usr/share/zsh/plugins/zsh-completion/completion.zsh 2>/dev/null
[ -e '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
