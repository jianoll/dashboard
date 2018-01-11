#!/usr/bin/env bash

resourcemanager_url='http://10.132.32.3:8088'
carbon_relay_host='10.13.32.32:2003'

yum install -y urw-fonts
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.6.3-1.x86_64.rpm
sudo yum localinstall grafana-4.6.3-1.x86_64.rpm

grafana-cli plugins install camptocamp-prometheus-alertmanager-datasource
grafana-cli plugins install abhisant-druid-datasource
grafana-cli plugins install foursquare-clouderamanager-datasource
grafana-cli plugins install crate-datasource
grafana-cli plugins install alexanderzobnin-zabbix-app
grafana-cli plugins install fastweb-openfalcon-datasource
grafana-cli plugins install grafana-worldmap-panel
grafana-cli plugins install digrich-bubblechart-panel
grafana-cli plugins install briangann-datatable-panel
grafana-cli plugins install jdbranham-diagram-panel
grafana-cli plugins install citilogics-geoloop-panel
grafana-cli plugins install grafana-piechart-panel
grafana-cli plugins install grafana-clock-panel

mkdir -p /var/lib/grafana/dashboards

wget https://github.com/xiaomatech/dashboard/archive/master.zip -O /tmp/master.zip
cd /tmp && unzip /tmp/master.zip
cp -rf /tmp/dashboard-master/dashboards/* /var/lib/grafana/dashboards/
cp -rf /tmp/dashboard-master/spark/* /var/lib/grafana/dashboards/
rm -rf /tmp/master.zip /tmp/dashboard-master

wget https://raw.githubusercontent.com/xiaomatech/dashboard/master/spark.js -O /usr/share/grafana/public/dashboards/spark.js

sed -i 's|http://localhost:8091|'$resourcemanager_url'|g' /usr/share/grafana/public/dashboards/spark.js

wget https://raw.githubusercontent.com/xiaomatech/dashboard/master/grafana.ini -O /etc/grafana/grafana.ini
sed -i 's|carbon_relay_host:2003|'$carbon_relay_host'|g' /etc/grafana/grafana.ini

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server


#添加 数据源: Prometheus,Zabbix,Elasticsearch_system_metrics,Elasticsearch_access_log,Elasticsearch_self_metrics,Graphite
#添加数据源的时候开启数据源自带的dashboards

#访问 http://grafana_host/dashboard/script/spark.js
