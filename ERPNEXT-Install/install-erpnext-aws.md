# To Install ERPNEXT on AWS EC2 instance of Ubuntu 22.04
#### While any size VM may work I found a "t2.medium" to work best for me

sudo apt-get update  
sudo apt-get upgrade  

#### Some of these are already installed so you may skip them if already installed
sudo apt-get install python3  
sudo apt-get install git  
sudo apt-get install curl  
sudo apt-get install python-setuptools  
sudo apt-get install python3-pip  
sudo apt-get install software-properties-common  

#### Install and configure MariaDB
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

#### Install Node v16.15.0 or later  
sudo apt-get install npm  
sudo npm install -g n  
sudo n stable  
sudo npm install -g yarn  
node --verison  

#### Just reboot for a clean system  
sudo reboot  

#### Install frappe bench
sudo pip install frappe-bench  

#### You can change the verison that is available to you at the time of install this will create a bench instance in frappe-bench folder in your home folder
bench init frappe-bench --frappe-branch v13.29.1  
cd frappe-bench  
bench get-app erpnext --branch v13.29.1  

bench new-site mysite.local  
bench --site mysite.local install-app erpnext  

#### Ready to start ERPNEXT in development mode
bench start  

#### Enjoy!





