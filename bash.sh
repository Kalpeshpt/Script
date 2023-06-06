#!/bin/sh

#######################################
# In case of any errors (e.g. MySQL) just re-run the script. Nothing will be re-installed except for the packages with errors.
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
Red='\033[0;31m'          # Red 
Color_Off='\033[0m'       # Reset color code


echo  "${Red} ██╗███╗   ██╗███████╗ ██████╗ ███████╗███████╗ ██████╗    ██╗    ██╗ █████╗ ██████╗ ██████╗ ██╗ ██████╗ ██████╗ ${Color_Off}"
echo  "${Red} ██║████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔════╝██╔════╝    ██║    ██║██╔══██╗██╔══██╗██╔══██╗██║██╔═══██╗██╔══██ ${Color_Off}"
echo  "${Red} ██║██╔██╗ ██║█████╗  ██║   ██║███████╗█████╗  ██║         ██║ █╗ ██║███████║██████╔╝██████╔╝██║██║   ██║██████╔╝${Color_Off}"
echo  "${Red} ██║██║╚██╗██║██╔══╝  ██║   ██║╚════██║██╔══╝  ██║         ██║███╗██║██╔══██║██╔══██╗██╔══██╗██║██║   ██║██╔══██╗${Color_Off}"
echo  "${Red} ██║██║ ╚████║██║     ╚██████╔╝███████║███████╗╚██████╗    ╚███╔███╔╝██║  ██║██║  ██║██║  ██║██║╚██████╔╝██║  ██║${Color_Off}"
echo  "${Red} ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚══════╝╚══════╝ ╚═════╝     ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝${Color_Off}"


echo "$Yellow \n Bash script for install an apache2, php, PHPMyAdmin, Mysql, DVWA, Nodejs,  OWASP Juice Shop. For Debian based systems... $Color_Off"
echo "$Purple \n Written by @Kalpesh Patil. $Color_Off"
                                                                                                                    

# Update packages and Upgrade system
echo "$Yellow \n Updating System.. $Color_Off"
apt-get update -y 

echo "$Yellow \n Install apache2 Server.. $Color_Off"
apt install apache2

echo "$Yellow \n install wget.. $Color_Off"
sudo apt install wget  

echo "$Yellow \n Move in Tmp folder $Color_Off"
cd /tmp

echo "$Yellow \n Download Mysql Repo $Color_Off"
wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb

echo "$Yellow \n Install Mysql Repo $Color_Off"
sudo apt install gnupg
cd /tmp
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt update

echo "$Yellow \n Install Mysql Server .. $Color_Off"
sudo apt install mysql-server

echo "$Yellow \n Updating System.. $Color_Off"
sudo apt update

echo "$Yellow \n Install PHP.. $Color_Off"
apt install php-common libapache2-mod-php php-cli
apt install php-mysql php-curl

echo "$Yellow \n Install PHPmyadmin.. $Color_Off"
apt install phpmyadmin

echo "$Yellow \n Install Git.. $Color_Off"
apt install git

echo "$Yellow \n Move In /var/www/html.. $Color_Off"
cd /var/www/html    

echo "$Yellow \n Dowload And Config DVWA.. $Color_Off"
git clone https://github.com/digininja/DVWA.git
chmod -R 777 DVWA
cd DVWA
cp config/config.inc.php.dist config/config.inc.php

echo "$Yellow \n Move in opt.. $Color_Off"
cd /opt

echo "$Yellow \n Download Juiceshope.. $Color_Off"
git clone https://github.com/juice-shop/juice-shop.git --depth 1

echo "$Yellow \n Install Curl.. $Color_Off"
apt install curl

echo "$Yellow \n Install Node js.. $Color_Off"
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
apt-get install -y nodejs

echo "$Yellow \n Config Juice shope.. $Color_Off"
cd juice-shop
npm install
touch juice-shop && echo -e '#!/bin/bash\ncd /opt/juice-shop\nnpm start' > juice-shop
mv juice-shop /usr/local/bin/
chmod 777 /usr/local/bin/juice-shop


echo "$Red \n For Phpmyadmin.. Browse to http://localhost/phpmyadmin $Color_Off"
echo "$Red \n For Create the Database of DVWA Run given cmd  in the readme file.. Browse to http://localhost/DVWA $Color_Off"
echo "$Red \n For Start the Juice shop run cmd juice-shop  Browse to http://localhost:3000 .. $Color_Off"
echo "$Red \n .................................................................The End...................................................................$Color_Off"

