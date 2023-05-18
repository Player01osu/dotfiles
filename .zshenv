# Lines configured by zsh-newuser-install
### EXPORT
#export LC_ALL
#export MOZ_ENABLE_WAYLAND=1
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export GOPATH="$XDG_DATA_HOME"/go

export ROSWELL_HOME="$XDG_CONFIG_HOME"/roswell

export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANDROID_USER_HOME=$ANDROID_HOME
export ANDROID_EMULATOR_HOME=$ANDROID_HOME
#export ANDROID_SERIAL=$ANDROID_HOME
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=$ANDROID_HOME

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _JAVA_AWT_WM_NONREPARENTING=1

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

export STUDIO_JDK=$XDG_CONFIG_HOME/java
export JDK_HOME=$STUDIO_JDK
export JAVA_HOME=$STUDIO_JDK
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio

#export DISPLAY=:1.0
export CARGO_HOME="$XDG_DATA_HOME"/Cargo
export DATABASE_URL="postgres://localhost:5432/wordtugDatabase"
#export DATABASE_URL="postgres://localhost:5432/forumDatabase"
export EDITOR="nvim"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|lfcd|lfub|lf|l|exa|lazygit|n|nsxiv|mocp|doas|config|wiki|startx|sx|Ex|paru|ping|cargo|trunk|zpdf|br|rgh|fzf-hist|pj)"
export MOZ_DBUS_REMOTE=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PF_COL1=5
export PF_COL3=5
export PF_INFO="ascii title os kernel shell editor pkgs memory"
export PGDATA=/var/lib/postgres/data/
export READER="zathura"
export REDISCLI_HISTFILE="$XDG_DATA_HOME"/redis/rediscli_history
export RLWRAP_HOME="$XDG_DATA_HOME"/rlwrap
export RUSTUP_HOME="$XDG_DATA_HOME"/Rustup
export SHELL="zsh"
export TERM="screen-256color"                      # getting proper colors
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export UNCRUSTIFY_CONFIG="$HOME"/.config/uncrustify/uncrustify.cfg
export VISUAL="nvim"
export WINEARCH=win32 # Only needed when executing the first command with that WINEPREFIX
export XAUTHORITY="$HOME"/.config/X11/.Xauthority
export XINITRC="$HOME"/.config/X11/.xinitrc
export ZDOTDIR="$HOME"/.config/zsh
export _Z_DATA="$XDG_DATA_HOME"/z
export HISTCONTROL=ignoredups
export SAVEHIST=10000
export HISTSIZE=10000

export XCURSOR_SIZE=32
export GDK_SCALE=1
export XCURSOR_THEME='BreezeX-Black'
export GTK_THEME='Dracula'

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

export PATH=/opt/wine-osu/bin:$CARGO_HOME/bin:$PATH
#:/usr/lib/jvm/java-19-openjdk/bin

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin/bar" ] ;
  then PATH="$HOME/.local/bin/bar:$PATH"
fi

if [ -d "$HOME/.local/bin/waybar" ] ;
  then PATH="$HOME/.local/bin/waybar:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#
export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
