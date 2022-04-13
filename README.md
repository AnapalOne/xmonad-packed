## XMonad Configuration by Anapal
![alt text](https://github.com/AnapalOne/pictures/blob/master/2022-04-13_17-41.png "XMonad")
   **NOTES: This configuration installs a lot of packages and programs, see config/help for list of programs.**   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Assumes that a desktop environment has already been installed.**

### Install git
``` 
 sudo pacman -S git
```

Verify:
``` 
git --version
```

### Download
``` 
git clone https://github.com/AnapalOne/.xmonad
```  


### Installation
To apply this config to your xmonad, simply copy `xmonad.hs` to `~/.xmonad/`
``` 
cd .xmonad
```
``` 
cp xmonad.hs ~/.xmonad/xmonad.hs
```
