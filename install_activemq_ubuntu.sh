#!/bin/bash
#####################################################################################
# Date            Version            Change
# 13/05/2019      2.0.1              Created (current)
#####################################################################################

# $1 = service_name
# $2 = activemq_install_dir
# $3 = jetty_port
# $4 = AMQ service account
# $5 = AMQ service group
# $6 = AMQ data directory

chown -R $4:$5 $2

mkdir -p $6
chown -R $4:$5 $2

chmod -R 775 $6
sudo cat > "/etc/systemd/system/$1.service" <<EOL
[Unit]
Description=$1 message queue
After=network.target

[Service]
Type=forking
ExecStart=$2/bin/activemq start
ExecStop=$2/bin/activemq stop

User=$4
Group=$5

UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOL

sudo chmod -R 750 "$2/bin/activemq"

# Exposing the port to access Ensemble from remote machine
sudo ufw allow "$3/tcp"
sudo ufw reload

sudo systemctl daemon-reload
sudo systemctl enable "$1"
sudo systemctl start "$1"
sudo systemctl status "$1"

