# XMonad Config by Anapal
A custom XMonad config for Arch Linux.
![alt text](https://github.com/AnapalOne/pictures/blob/master/2022-04-13_17-41.png "XMonad")
   **NOTES: This configuration installs a lot of packages and programs, see setup.sh for the list of installing packages.**   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Assumes that a desktop environment has already been installed.**
   <!-- I know, very ugly. --> 

## Installation
- Installing git
``` 
 sudo pacman -S git
```

- Verify:
``` 
git --version
```

- Download
``` 
git clone https://github.com/AnapalOne/.xmonad
```  

## Setup
- Automatically setup XMonad config with installed packages
```
setup.sh
```

- If you want to only apply this config to your xmonad, simply copy `xmonad.hs` to `~/.xmonad/`
- If you want to only apply xmobar, copy `xmobar` to `~/.xmobarrc/`

## List of packages
| Packages                                           | Description |
| ---------------------------------------------------|:-------------:|
| alacritty                                          | terminal emulator |
| xmonad, xmonad-contrib                             | main window manager |
| pulseaudio                                         | audio manager |
| pamixer                                            | volume control w/ gui |
| youtube-dl                                         | youtube video/audio downloader |
| nerd-fonts-complete, ttf-iosevka, ttc-iosevka-aile | fonts |
| htop                                               | program manager |
| ncdu                                               | file manager |
| df                                                 | system filesize |
| iwctl                                              | internet manager |
| pacman, yay                                        | package manager (yay for AUR) |
| subl, nano, vim                                    | text editors |
| xprop                                              | shows information about a window |
| flameshot                                          | capture screen |
| tlp, tlpui                                         | battery manager |
| nitrogen                                           | wallpaper |
| chromium                                           | browser |
| krita                                              | drawing software |
| gimp                                               | image editor/drawing software |
| mpv, vlc                                           | video software |
| audacity                                           | audio software |
| mirage                                             | image viewer |
| spotify                                            | music |
| discord                                            | text and voice app |
| github-desktop                                     | github desktop |
