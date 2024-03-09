setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.

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

spotdl_pair () {
    if [ -z $2 ]; then
        echo 'Requires two arguments; (yt url) and (spotify url)'
        return 1
    fi
    spotdl download "${1}|${2}"
}

rgh () {
    if [ -z $1 ]; then
        echo 'rgh: Takes in string as argument'
        return 1
    fi

    case $1 in
        "-f")
            if [ -z $2 ]; then
                echo 'rgh: Expected an argument'
                return 1
            fi

            cmd=$(rg -I $2 $HISTFILE | fzf --height 80% --tac)
            if [ -z $cmd ]; then; return 0; fi
            echo $cmd
            echo $cmd >> $HISTFILE
            zsh -c $cmd
        ;;
        *) rg -I $1 $HISTFILE
    esac
}

yt_music () {
    yt-dlp --extract-audio --audio-format flac --audio-quality 0 $1 --embed-metadata --embed-thumbnail --embed-chapters
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

source $HOME/.local/bin/proj-jump.sh

bindkey '^e' edit-command-line

bindkey -s '^o' 'lfcd\n'

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

#alias animemnt="sshfs player01@192.168.1.87:Videos/not-anime ~/Videos/remote -C"
alias Ex="nvim -c ':Ex'"
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias animemnt="doas mount 192.168.1.87:/srv/nfs/Videos/not-anime /mnt/Videos/not-anime && mount --bind /mnt/Videos/not-anime /home/bruh/Videos/not-anime-remote"
alias bc="bc --mathlib"
alias block="betterlockscreen -l blur"
alias bluetooth="bluetoothctl"
alias calibre=calibre --with-library "$XDG_DATA_HOME/Calibre Library"
alias cbonsair="cbonsai --seed 119"
alias choosenim="choosenim --choosenimDir:${XDG_DATA_HOME}/choosenim"
alias codef="cd ~/Documents/code"
alias discordgpu="LIBVA_DRIVER_NAME=i915 discord --enable-gpu-rasterization && rm -rf ~/.pki"
alias dpu='LIBVA_DRIVER_NAME=i915 devour discord --enable-gpu-rasterization && rm -rf ~/.pki'
alias dwm-conf="cd ~/gitclone/suckless/dwm && nvim ~/gitclone/suckless/dwm/config.h"
alias fortnite="osu"
alias gbookmark="nvim ~/.local/share/bookmarks/bookmarks"
alias getweather="curl wttr.in/west+bloomfield+township\?m && cal && date"
alias hsetwall="hsetroot -cover ~/Pictures/wallpapers/wp.jpg"
alias l="eza -a1 --icons --sort=type"
alias lf="lfub"
alias lfwp="lfub ~/Pictures/wallpapers/"
alias locknow="loginctl suspend && betterlockscreen -l blur"
alias ls="eza -a --icons --sort=type"
alias man-keep="man -P 'less -X'"
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
alias nvide="neovide --multigrid"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias octave="octave -q"
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
alias wiki="nvim ~/Documents/org/index.norg"
alias xinitrc="nvim ~/.xinitrc"
alias xmon="xrandr --output HDMI-A-0 --primary --left-of eDP && sleep 1 && hsetroot -cover ~/Pictures/wallpapers/wp.jpg && krepeat"
alias xmonsame="xrandr --auto && xrandr --output HDMI-A-0 --same-as eDP && sleep 1 && hsetroot -cover ~/Pictures/wallpapers/wp.jpg && krepeat"
alias yt_mpv_360='mpv --ytdl-format=18'
alias yt_mpv_720='mpv --ytdl-format=22'
alias yta="yt-dlp -x --audio-format mp3"
alias zathura="devour zathura"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-completion/completion.zsh 2>/dev/null
#. /usr/share/z/z.sh
eval "$(zoxide init zsh)"
source $HOME/.config/broot/launcher/bash/br
