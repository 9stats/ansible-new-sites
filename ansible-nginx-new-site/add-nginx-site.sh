4 lines (8 sloc)  517 Bytes
 

read -p 'Existing customer user account to run as: ' customer
[[ -z "$customer" ]] && { echo "User account empty. Quitting." ; exit 1; }
[ -z "$(id $customer)" ] && { echo "User does not exist. Quitting." ; exit 1; }


read -p 'Domain or Subdomain: ' site

ls -l /etc/nginx/sites-enabled

read -p "Choose the next number up skiping by 10 example 110 120 : " numb

read -p 'DB name live_examle stag_examle: ' db_name

ansible-playbook -i hosts playbook.yml  -e "site=$site customer=$customer db_name=$db_name numb=$numb"
