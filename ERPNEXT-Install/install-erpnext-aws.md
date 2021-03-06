# To Install ERPNEXT on AWS EC2 instance of Ubuntu 20.04 OR 22.04
#### While any size VM may work I found a "t2.medium" to work best for me

sudo apt-get update  
sudo apt-get upgrade  

#### Some of these are already installed so you may skip them if already installed
sudo apt-get install python3  
sudo apt-get install git  
sudo apt-get install curl  
sudo apt-get install python3-setuptools  
sudo apt-get install python3-pip  
sudo apt-get install software-properties-common  
sudo apt-get install wkhtmltopdf  

#### Install and configure MariaDB (for ubuntu 20.04 use mariadb 10.3)
sudo apt-get update  
sudo apt-get install mariadb-server-10.6  
sudo apt-get install libmysqlclient-dev  

sudo vim /etc/mysql/my.cnf  

====== Edit and Add to my.cnf =========  
[mysqld]  
character-set-client-handshake = FALSE  
character-set-server = utf8mb4  
collation-server = utf8mb4_unicode_ci  
  
[mysql]  
default-character-set = utf8mb4  
====== End of Edit ==================  

sudo service mariadb start  
#### This next step will ask you to set root password of mariadb
sudo mysql_secure_installation  

#### Install Redis Server  
sudo apt-get install redis-server  

#### Install Node v14 (any other version seem to cause an error on bench init) 
sudo apt-get install npm  
sudo npm install -g n  
sudo n 14  
sudo npm install -g yarn    
node --version  

#### Just reboot for a clean system  
sudo reboot  

#### Install frappe bench
sudo pip install frappe-bench  

#### You can change the verison that is available to you at the time of install this will create a bench instance in frappe-bench folder in your home folder (This takes a while to finish)
bench init frappe-bench --frappe-branch v13.29.1  
cd frappe-bench  
bench get-app erpnext --branch v13.29.1  

bench new-site mysite.local  
bench --site mysite.local install-app erpnext  
bench use mysite.local  

#### Ready to start ERPNEXT in development mode
bench start  

#### Make sure the port for web server (usually 8000) is open on your aws firewall

#### Enjoy!





