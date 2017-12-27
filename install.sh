#!/usr/bin/env bash

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

mkdir -p /var/lib/grafana/dashboards

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server


#添加 数据源: Prometheus,Zabbix,Elasticsearch_system_metrics,Elasticsearch_access_log,Elasticsearch_self_metrics
#添加数据源的时候开启数据源自带的dashboards
