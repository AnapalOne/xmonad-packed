[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## A custom [xmonad](https://xmonad.org) configuration with clickable workspaces and easy naviagation, packed with tons of [pre-installed packages](https://github.com/AnapalOne/xmonad#list-of-packages) for Arch Linux.

![alt text](https://github.com/AnapalOne/xmonad/blob/main/2022-04-13_17-41.png "xmonad")

## Requirements
### xmonad
```
sudo pacman -S xmonad xmonad-contrib
```
- I recommend using [xinit](https://wiki.archlinux.org/title/Xinit) to automatically start xmonad *or* to use a [display manager](https://wiki.archlinux.org/title/Display_manager).
- Read the wiki for more details: https://wiki.archlinux.org/title/Xmonad

### git
``` 
sudo pacman -S git
```
  - Verify: `git --version`

### yay
```
git clone https://aur.archlinux.org/yay.git && cd yay
```
```
makepkg -si
``` 

## Setup
#### Download xmonad repo
``` 
git clone https://github.com/AnapalOne/xmonad && cd xmonad
``` 
#### Give permission to execute script that automatically installs packages and configures xmonad
```
chmod +x ./setup.sh
```
#### Run script
```
./setup.sh
```
```
reboot
```

- If you want to only apply the xmonad config to your xmonad, simply copy `xmonad.hs` to `~/.xmonad/`
- If you want to only apply xmobar, copy `xmobar` to `~/.xmobarrc/`
 ##### And you're done! You may edit any of these configs to your liking.

## List of packages
| Packages                                           | Description |
| ---------------------------------------------------|:-------------:|
| alacritty                                          | terminal emulator |
| p7zip                                              | archiving and compression of files |
| xmobar                                             | status bar |
| picom                                              | compositor |
| libreoffice                                        | office suite |
| xf86-input-libinput, libinput-gestures             | input device handler, touchscreen, touchpad drivers |
| pulseaudio                                         | audio manager |
| pamixer                                            | volume control w/ gui |
| youtube-dl                                         | youtube video/audio downloader |
| ttf-iosevka[-aile,-curly], ttf-bitstream-vera, ttf-nerd-fonts-symbols-mono | fonts |
| xdotool                                            | input emulator |
| htop                                               | program manager |
| ncdu                                               | disk usage analyzer |
| nnn                                                | file manager |
| iwctl                                              | internet manager |
| yay                                                | AUR helper |
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

## Troubleshooting
#### After installation, some packages may not work. Here are some that I've found that might help you.

### sublime-text-4
- Sublime Text may not install properly, so be sure to reinstall it after booting into xmonad.

### picom not working
- This may be a result of one of your drivers not working, be sure to check them to see if there are any errors.
