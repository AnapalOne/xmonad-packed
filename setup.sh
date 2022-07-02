# Confirmation
read -p "Do you want to install this configuration now? (y/n) " yn

case $yn in
      [Yy] ) echo "Installing.." ;;
      [Nn] ) exit ;;
         * ) echo "Invalid choice."
             exit ;;
esac

# Install packages
bash -c 'sudo pacman -S --noconfirm xmonad xmonad-contrib alacritty xterm wget dmenu xf86-input-libinput alsa-utils xmobar neofetch htop ncdu vim nano xorg xorg-xinit p7zip flameshot pulseaudio-alsa pulseaudio-bluetooth pamixer tlp youtube-dl ranger cmus nitrogen firefox krita xdotool gimp mpv vlc audacity discord libreoffice-still ttc-iosevka ttc-iosevka-aile ttc-iosevka-curly ttf-bitstream-vera ttf-font ttf-nerd-fonts-symbols-mono'
bash -c 'yay -S --noconfirm --mflags --skipinteg --answerclean All --answerdiff All --answeredit All --answerupgrade Repo tlpui-git spotify picom-jonaburg-git github-desktop-bin mirage libinput-gestures sublime-text-4'

# Make directories
[[ -d ~/.xmonad ]] && echo "~/.xmonad already exists." || (echo "Creating ~/.xmonad directory.." && bash -c 'mkdir ~/.xmonad')
[[ -d ~/.xmobarrc ]] && echo "~/.xmobarrc already exists." || (echo "Creating ~/.xmobarrc directory.." && bash -c 'mkdir ~/.xmobarrc')
[[ -d ~/.config/alacritty ]] && echo "~/.config/alacritty already exists." || (echo "Creating ~/.config/alacritty directory.." && bash -c 'mkdir -p ~/.config/alacritty')
[[ -d ~/.config/xmonad/ ]] && echo "~/.config/xmonad/ already exists." || (echo "Creating ~/.config/xmonad/ directory.." && bash -c 'mkdir -p ~/.config/xmonad/scripts')
[[ -d ~/.config/picom ]] && echo "~/.config/picom already exists." || (echo "Creating ~/.config/picom directory.." && bash -c 'mkdir ~/.config/picom')
[[ -d ~/.config/neofetch ]] && echo "~/.config/neofetch already exists." || (echo "Creating ~/.config/neofetch directory.." && bash -c 'mkdir ~/.config/neofetch')
[[ -d ~/Pictures/Ascii/ ]] && echo "~/Pictures/Ascii/ already exists." || (echo "Creating ~/Pictures/Ascii/ directory.." && bash -c 'mkdir -p ~/Pictures/Ascii/ ')

# Move configs and files to directories
echo "Copying xmonad.hs to ~/.xmonad/" && bash -c 'cp xmonad.hs ~/.xmonad/'
echo "Copying xmobar.hs to ~/.xmobarrc/" && bash -c 'cp xmobar.hs ~/.xmobarrc/'
echo "Copying alacritty.yml to ~/.config/alacritty/" && bash -c 'cp config/alacritty.yml ~/.config/alacritty/'
echo "Copying help to ~/.config/xmonad/" && bash -c 'cp files/help ~/.config/xmonad/'
echo "Copying picom.conf to ~/.config/picom/" && bash -c 'cp config/picom.conf ~/.config/picom/'
echo "Copying neofetch_config.conf to ~/.config/neofetch/config.conf" && bash -c 'cp config/neofetch_config.conf ~/.config/neofetch/config.conf'
echo "Copying archlinux.txt to ~/Pictures/Ascii/" && bash -c 'cp files/archlinux.txt ~/Pictures/Ascii/'
echo "Copying help.sh and startup_window.sh to ~/.config/xmonad/scripts/" && bash -c 'cp config/shell/help.sh config/shell/startup_window.sh ~/.config/xmonad/scripts/'

# Add execution permissions to shell scripts
bash -c 'chmod +x ~/.config/xmonad/scripts/help.sh && chmod +x ~/.config/xmonad/scripts/startup_window.sh'
