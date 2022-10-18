#!/bin/bash
ansible-playbook -i hosts nginxwatcher.yml

echo -e "Now update /etc/nginx/sites-enabled/* sites with included config files!\n"
