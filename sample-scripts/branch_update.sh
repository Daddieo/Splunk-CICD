/opt/splunk/bin/splunk stop
cd /home/ansible/splunk
git checkout master
git pull
git checkout $1
git pull
sleep 15
find  /opt/splunk/etc/apps/SA-I* -regex '.*/local/.*' -delete
sleep 1
find  /opt/splunk/etc/apps/itso_* -regex '.*/local/.*' -delete
sleep 1
rsync -avzh /home/ansible/splunk/UIs/nls-es/ /opt/splunk/etc/apps/ --exclude '*.csv'
sleep 1
rsync -avzh /home/ansible/splunk/TAs/_global/ /opt/splunk/etc/apps/ --exclude '*.xxxcsv'
sleep 1
rsync -avzh /home/ansible/splunk/TAs/nls-es/ /opt/splunk/etc/apps/ --exclude '*.csv'
sleep 1
rsync -avzh /home/ansible/splunk/TAs/soc-dev/ /opt/splunk/etc/apps/ --exclude '*.csv'
sleep 1
rsync -avzh /home/ansible/splunk/UIs/_global/ /opt/splunk/etc/apps/ --exclude '*.csxv'
sleep 1
rsync -avzh /home/ansible/splunk/UIs/nls-es/ /opt/splunk/etc/apps/ --exclude '*.csv'
sleep 1
rsync -avzh /home/ansible/splunk/UIs/soc-dev/ /opt/splunk/etc/apps/ --exclude '*.csv'
sleep 1
chown -R splunk /opt/splunk/etc/apps
/opt/splunk/bin/splunk start
