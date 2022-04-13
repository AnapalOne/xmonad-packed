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

- Automatically setup xmonad config
```
setup.sh
```

-- If you only want to apply this config to your xmonad, simply copy `xmonad.hs` to `~/.xmonad/`
``` 
cp xmonad.hs ~/.xmonad/xmonad.hs
```
