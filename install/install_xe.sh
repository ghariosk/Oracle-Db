#!/bin/bash

sudo yum update -y

# sudo yum install php -y 

# sudo yum install java-1.8.0-openjdk -y

sudo yum install unzip -y

unzip /home/vagrant/install/oracle-xe-11.2.0-1.0.x86_64.rpm.zip

#export _SCRATCH = 

sudo yum install bc -y

sudo su root -c "rpm -i /home/vagrant/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm"

sed -i 's/ORACLE_PASSWORD=<value required>/ORACLE_PASSWORD=password/g' /home/vagrant/Disk1/response/xe.rsp 

sed -i 's/ORACLE_CONFIRM_PASSWORD=<value required>/ORACLE_CONFIRM_PASSWORD=password/g' /home/vagrant/Disk1/response/xe.rsp 

sudo su root -c '/etc/init.d/oracle-xe configure responseFile=/home/vagrant/Disk1/response/xe.rsp'

sudo iptables -F

sudo iptables -A INPUT -m state --state NEW -p tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT -m state --state NEW -p tcp --dport 1521 -j ACCEPT

rm -rf /home/vagrant/Disk1

echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" >> /etc/profile
echo "export ORACLE_SID=XE" >> /etc/profile
echo "export PATH=$PATH:/u01/app/oracle/product/11.2.0/xe/bin" >> /etc/profile

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe

export ORACLE_SID=XE 

export PATH=$PATH:/u01/app/oracle/product/11.2.0/xe/bin



sudo su - oracle -c "/u01/app/oracle/product/11.2.0/xe/bin/sqlplus -s  / as sysdba <<EOF
shutdown immediate;
startup nomount;
alter database mount;
alter database open;
quit
EOF"











