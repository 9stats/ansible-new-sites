
#bash.sh

read -p "Existing customer user account to run as: " user
[[ -z "$user" ]] && { echo "User account empty. Quitting." ; exit 1; }
[ -z "$(id $user)" ] && { echo "User does not exist. Quitting." ; exit 1; }


read -p "Enter new db dev stag live_example_db no DOTS : " db

read -p "Enter new dbuser example_usr no DOTS : " dbuser

dbuserpass=$(/usr/bin/pwgen -s 40 1)

mysql -u root --execute="CREATE DATABASE $db"

mysql -u root --execute="CREATE USER $dbuser@'localhost' IDENTIFIED WITH mysql_native_password BY '$dbuserpass'"

mysql -u root --execute="CREATE USER $dbuser@'127.0.0.1' IDENTIFIED WITH mysql_native_password BY '$dbuserpass'"

mysql -u root --execute="GRANT ALL ON $db.* TO $dbuser@'localhost';"

mysql -u root --execute="GRANT ALL ON $db.* TO $dbuser@'127.0.0.1';"

mysql -u root --execute="flush privileges;"

echo  db=$db dbuser=$dbuser dbuserpass=$dbuserpass > /home/$user/$db.txt

mysql -u root --execute="show databases"


echo "Database created DB credential registered in /home/$user/$db.txt"
