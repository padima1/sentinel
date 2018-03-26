#!/bin/bash
cd /root/.tecaxcore
sudo apt-get install -y git python-virtualenv
sudo git clone https://github.com/dashpay/sentinel.git
cd sentinel
export LC_ALL=C
sudo apt-get install -y virtualenv
virtualenv ./venv
./venv/bin/pip install -r requirements.txt
echo "texac_conf=/root/.tecaxcore/tecax.conf" >> /root/.tecaxcore/sentinel/sentinel.conf
#setup cron
crontab -l > tempcron
echo "* * * * * cd /root/.tecaxcore/sentinel && ./venv/bin/python bin/sentinel.py 2>&1 >> sentinel-cron.log" > tempcron
 
crontab tempcron
rm tempcron
