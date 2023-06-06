<h1 align=center>👨🏻‍💻 Vulnerable Pentesting Lab Environment Installation Script.</h1>

## ☢ Description 

The purpose of this bash script is to automate the installation process of various important step which are useful in web penetration testing practice.This script saves a significant amount of time and effort when compared to manually installing.Any suggestions for improvement are always appreciated.

<h2 align=left> 🌐 Script Install </h2>

 <ol>
  <li>Apache2 web server</li>
  <li>Php</li>
  <li>Phpmyadmin</li>
  <li>Mysql</li>
  <li>DAVWA</li>
  <li>Node js</li>
  <li>OWASP Juice Shop</li>
</ol>

## After complete the installation of script

<p> For DVWA Lab           --       http://127.0.0.1/DVWA </p>
<p> For Juice-shop run cmd --       juice-shop  </p>
<p> For Phpmyadmin          --       http://127.0.0.1/phpmyadmin/  </p>

## 🔐 Database setup  for DVWA
<h2> Source of DVWA </h2>

```
https://github.com/digininja/DVWA
```


To set up the database, simply click on the `Setup DVWA` button in the main menu, then click on the `Create / Reset Database` button. This will create / reset the database for you with some data in.

If you receive an error while trying to create your database, make sure your database credentials are correct within `./config/config.inc.php`. *This differs from config.inc.php.dist, which is an example file.*

The variables are set to the following by default:

```php
$_DVWA[ 'db_server'] = '127.0.0.1';
$_DVWA[ 'db_port'] = '3306';
$_DVWA[ 'db_user' ] = 'dvwa';
$_DVWA[ 'db_password' ] = 'p@ssw0rd';
$_DVWA[ 'db_database' ] = 'dvwa';
```

Note, if you are using MariaDB rather than MySQL (MariaDB is default in Kali), then you can't use the database root user, you must create a new database user. To do this, connect to the database as the root user then use the following commands:

```mysql
mysql> create database dvwa;
Query OK, 1 row affected (0.00 sec)

mysql> create user dvwa@localhost identified by 'p@ssw0rd';
Query OK, 0 rows affected (0.01 sec)

mysql> grant all on dvwa.* to dvwa@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)
```



## ⚙️ Installation 
```
wget https://github.com/Kalpeshpt/Script/blob/main/bash.sh
```
```
chmod +x bash.sh
```
## Usage
```
./bash.sh
```
