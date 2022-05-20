# Install packages
bash -c 'sudo pacman -S --noconfirm xmonad xmonad-contrib alacritty xterm wget dmenu xf86-input-libinput xmobar neofetch htop ncdu vim nano xorg xorg-xinit p7zip flameshot pulseaudio-alsa pulseaudio-bluetooth pamixer tlp youtube-dl ranger cmus nitrogen firefox krita xdotool gimp mpv vlc audacity discord libreoffice-still ttc-iosevka ttc-iosevka-aile ttc-iosevka-curly ttf-bitstream-vera ttf-font ttf-nerd-fonts-symbols-mono'
bash -c 'yay -S --mflags --skipinteg --answerclean All --answerdiff All --answeredit All --answerupgrade Repo tlpui-git spotify picom-jonaburg-git github-desktop-bin mirage libinput-gestures sublime-text-4'

# Move configs and files to directories
bash -c 'mkdir ~/.xmonad && cp xmonad.hs ~/.xmonad/'
bash -c 'mkdir ~/.xmobarrc && cp xmobar ~/.xmobarrc/'
bash -c 'mkdir -p ~/.config/alacritty && cp config/alacritty.yml ~/.config/alacritty/'
bash -c 'mkdir -p ~/.config/xmonad/scripts && cp files/help ~/.config/xmonad/'
bash -c 'mkdir ~/.config/picom && cp config/picom.conf ~/.config/picom/'
bash -c 'mkdir ~/.config/neofetch && cp config/neofetch_config.conf ~/.config/neofetch/config.conf'
bash -c 'mkdir -p ~/Pictures/Ascii/ && cp files/archlinux.txt ~/Pictures/Ascii/'

# Add execution permissions to shell scripts
bash -c 'cp config/shell/help.sh config/shell/startup_screen.sh ~/.config/xmonad/scripts/ && chmod +x ~/.config/xmonad/scripts/help.sh && chmod +x ~/.config/xmonad/scripts/startup_screen.sh'
