#!/bin/sh
mkdir -p ~/.config/

if [ -d ~/.config/lazygit ]; then
        echo "lazygit configs detected, backing up..."
        mkdir ~/.config/lazygit.old && mv ~/.config/lazygit/* ~/.config/lazygit.old/
        cp -r ~/just-dotfiles/.config/lazygit/* ~/.config/lazygit/;
    else
        echo "Installing rofi configs..."
        mkdir ~/.config/lazygit && cp -r ~/just-dotfiles/.config/lazygit/* ~/.config/lazygit/;
    fi
