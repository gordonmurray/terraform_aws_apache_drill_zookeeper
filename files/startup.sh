#!/bin/bash
sed -i "s/localhost/${zookeeper_private_ip}/" /home/ubuntu/apache-drill-1.20.2/conf/drill-override.conf
cd /home/ubuntu/apache-drill-1.20.2/bin && ./drillbit.sh start