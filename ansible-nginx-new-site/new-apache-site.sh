read -p 'Existing customer user account to run as: ' customer
[[ -z "$customer" ]] && { echo "User account empty. Quitting." ; exit 1; }
[ -z "$(id $customer)" ] && { echo "User does not exist. Quitting." ; exit 1; }


read -p 'Domain or Subdomain: ' site

ls -l /etc/apache2/sites-enabled

read -p "Choose the next number up skiping by 10 example 110 120 : " numb

read -p 'DB name live_examle stag_examle: ' db_name

php -v

read -p 'State version of PHP jist the number: ' phpver

ansible-playbook -i hosts apache.yml  -e "site=$site customer=$customer db_name=$db_name numb=$numb phpver=$phpver"
