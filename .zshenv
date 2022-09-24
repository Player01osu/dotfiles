# Lines configured by zsh-newuser-install
### EXPORT
#export LC_ALL
#export MOZ_ENABLE_WAYLAND=1
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state

export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/Cargo
export DATABASE_URL="postgres://localhost:5432/forumDatabase"
export EDITOR="nvim"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|lfcd|lfub|lf|l|exa|lazygit|n|nsxiv|mocp|doas|config|wiki|startx|sx|Ex|paru|ping|cargo|trunk|zpdf|br)"
export MOZ_USE_XINPUT2=1
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PF_INFO="ascii title os kernel shell editor pkgs memory"
export PF_COL1=5
export PF_COL3=5
export PGDATA=/var/lib/postgres/data/
export RUSTUP_HOME="$XDG_DATA_HOME"/Rustup
export READER="zathura"
export SHELL="zsh"
export TERM="xterm-256color"                      # getting proper colors
export UNCRUSTIFY_CONFIG="$HOME"/.config/uncrustify/uncrustify.cfg
export VISUAL="nvim"
export WINEARCH=win32 # Only needed when executing the first command with that WINEPREFIX
export XAUTHORITY="$HOME"/.config/X11/.Xauthority
export XINITRC="$HOME"/.config/X11/.xinitrc
export ZDOTDIR="$HOME"/.config/zsh
export _Z_DATA="$XDG_DATA_HOME"/z

export MASTER_KEY="þá9sMá«ùË{n_Ep¯ëxMëFq3+[Kfëxû0In'7QúºÐ2"

# Arch Linux/wine-osu users should uncomment next line
# to update PATH to make sure we're using the right Wine binary
export PATH=/opt/wine-osu/bin:$CARGO_HOME/bin:$PATH
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

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi
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
