# ActiveMQ-installation
ActiveMq is designed for the purpose of sending messages between two applications, or two components inside one application

Steps to install activemq:

1. Download activemq setup 

2. Make changes as per config.ini like ActiveMQ directory, setup name.

3. run folowing command to install and configure ActiveMQ on ubuntu.

4. ansible-playbook -e "configFile=config.ini hosts=<host_name>" -i /etc/ansible/inventory -vvv


