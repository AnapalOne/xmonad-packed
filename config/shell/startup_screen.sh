#!/bin/sh

# color reference
# normal = "\e[1;0m%-6s\e[m"
# red = "\e[1;31m%-6s\e[m"
# green = "\e[1;32m%-6s\e[m"
# yellow = "\e[1;33m%-6s\e[m"
# blue = "\e[1;34m%-6s\e[m"
# magenta = "\e[1;35m%-6s\e[m"
# cyan = "\e[1;36m%-6s\e[m"
# white = "\e[1;37m%-6s\e[m"

# 3 types of startup screen designs
#	- boxSlash
#	- box
#	- slash
#	You can add another by making another option in the case statement. (eg. custom)
startupscreen="boxSlash"

case "$startupscreen" in
	"boxSlash") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "                     [-----------------------------------------------------------------]" && printf "\n                     |    / / / / / / / /  Welcome to Arch Linux! \ \ \ \ \ \ \ \ \    |\n                     |   / / / / / / / Custom XMonad config by Anapal  \ \ \ \ \ \ \   | \n" && printf "                     [-----------------------------------------------------------------]" && printf "\n\n\e[1;36m%-6s\e[m" "                                Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                             "&& printf "\e[1;36m%-6s\e[m" " Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                      Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'
;;
	"box") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "                      [-----------------------------------------------------------------]" && printf "\n                      |                     Welcome to Arch Linux!                      |\n                      |                 Custom XMonad config by Anapal                  | \n" && printf "                      [-----------------------------------------------------------------]" && printf "\n\n\e[1;36m%-6s\e[m" "                                Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                              "&& printf "\e[1;36m%-6s\e[m" "Super" && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                      Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'  
;;
	"slash") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "\n                        / / / / / / / / /  Welcome to Arch Linux!  \ \ \ \ \ \ \ \ \    \n                       / / / / / / / / Custom XMonad config by Anapal \ \ \ \ \ \ \ \   \n\n" && printf "\e[1;36m%-6s\e[m" "                                Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                              "&& printf "\e[1;36m%-6s\e[m" "Super" && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                      Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'
;;
esac