Green='\033[0;32m'
Cyan='\033[0;36m'  
Default='\033[0m'  
ICyan='\033[0;96m' 

echo -e  "${Green}Welcome to the UroborosQ's update script!${Default}"

echo -e "${ICyan}yay updating...${Default}"

yay

echo -e "${ICyan}flatpak updating...${Default}"

flatpak update

current_directory=$(pwd)


echo -e "${ICyan}git repos updating...${Default}"

echo -e "${Cyan}libadwaita-theme-changer${Default}"
cd /home/uroborosq/.local/share/libadwaita-theme-changer/

git pull


cd -- "$current_directory"