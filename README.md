[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## A custom [xmonad](https://xmonad.org) configuration with clickable workspaces and easy naviagation, packed with tons of [pre-installed packages](https://github.com/AnapalOne/xmonad-packed#list-of-packages) for Arch Linux.

![alt text](https://github.com/AnapalOne/xmonad-packed/blob/main/50s5zbz9gqu81.png "xmonad")
> **Note:** `xmonad.hs` will have configurations for packages not included in this setup. Generally these will not cause problems or decrease the performance of xmonad, but if the extra lines of code bother you, feel free to remove them if you like.

## Requirements
### Display manager / xinit
- [xinit](https://wiki.archlinux.org/title/Xinit) to automatically start xmonad *or* use a [display manager](https://wiki.archlinux.org/title/Display_manager).
- Read the wiki for more details: https://wiki.archlinux.org/title/xmonad#Starting

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

## Installation
#### Download xmonad repo
``` 
git clone https://github.com/AnapalOne/xmonad-packed && cd xmonad-packed
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
   - You will need to add some configs in `xmonad.hs logHook` in order for this xmobar to work. [Details found here.](https://hackage.haskell.org/package/xmonad-contrib-0.17.0/docs/XMonad-Hooks-DynamicLog.html)
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
| nnn, ranger                                        | file manager |
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
| spotify, cmus                                      | music |
| discord                                            | text and voice app |
| github-desktop                                     | github desktop |

## Troubleshooting

### Some programs not found
- Packages may not install properly, so be sure to check and reinstall it after booting into xmonad.

### picom not working
- Try disabling vsync by changing the setting in `~/.config/picom/picom.conf`.
- An error may occur as a result of your graphical drivers not working/compatible with picom, so try installing [Intel](https://wiki.archlinux.org/title/intel_graphics), [NVIDIA](https://wiki.archlinux.org/title/NVIDIA), or [other](https://wiki.archlinux.org/title/Hybrid_graphics) drivers depending on your GPU. 
- picom will **not** work with VirtualBox, causing a sort of [HOM effect](https://doomwiki.org/wiki/Hall_of_mirrors_effect). To fix this, open the terminal with `Super + Shift + Enter` and type `killall picom` (note that you won't see any activity, so you might have do it blindly). As a result, there will be no compositor running but xmonad can be used without it.
   - Currently working on a fix, stay tuned for updates.
