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
	"boxSlash") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "                     \033[36;1m[-----------------------------------------------------------------]\033[0m" && printf "\n                     \033[36;1m|\033[0m    \033[34;1m/ / / / / / / /\033[0m  Welcome to Arch Linux! \033[34;1m\ \ \ \ \ \ \ \ \ \033[0m   \033[36;1m|\033[0m\n                     \033[36;1m|\033[0m   \033[34;1m/ / / / / / /\033[0m Custom XMonad config by Anapal  \033[34;1m\ \ \ \ \ \ \ \033[0m  \033[36;1m|\033[0m \n" && printf "                     \033[36;1m[-----------------------------------------------------------------]\033[0m" && printf "\n\n\e[1;36m%-6s\e[m" "                                Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                             "&& printf "\e[1;36m%-6s\e[m" " Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                      Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'
;;
	"box") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "                     \033[36;1m[-----------------------------------------------------------------]\033[0m" && printf "\n                     \033[36;1m|\033[0m                     Welcome to Arch Linux!                      \033[36;1m|\033[0m\n                     \033[36;1m|\033[0m                 Custom XMonad config by Anapal                  \033[36;1m|\033[0m \n" && printf "                     \033[36;1m[-----------------------------------------------------------------]\033[0m" && printf "\n\n\e[1;36m%-6s\e[m" "                                Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                              "&& printf "\e[1;36m%-6s\e[m" "Super" && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                      Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'  
;;
	"slash") alacritty -t welcome -e bash -c 'neofetch --ascii ${HOME}/Pictures/Ascii/archlinux.txt && printf "\n                        \033[34;1m/ / / / / / / / /\033[0m  Welcome to Arch Linux!  \033[34;1m\ \ \ \ \ \ \ \ \\033[0m    \n                       \033[34;1m/ / / / / / / /\033[0m Custom XMonad config by Anapal \033[34;1m\ \ \ \ \ \ \ \\033[0m   \n\n" && printf "\e[1;36m%-6s\e[m" "                               Super " && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Enter " && printf "to open a new terminal.\n                             "&& printf "\e[1;36m%-6s\e[m" "Super" && printf "+" && printf "\e[1;36m%-6s\e[m" " Shift " && printf "+" && printf "\e[1;36m%-6s\e[m" " Slash " && printf "to show a list of programs.\n\n\n                                     Press "&& printf "\e[1;33m%-6s\e[m" "enter " && printf "to close this screen." && read -p ""'
;;
esac