#!/usr/bin/env bash

yum install -y urw-fonts
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.6.3-1.x86_64.rpm
sudo yum localinstall grafana-4.6.3-1.x86_64.rpm

grafana-cli plugins install camptocamp-prometheus-alertmanager-datasource
grafana-cli plugins install abhisant-druid-datasource
grafana-cli plugins install foursquare-clouderamanager-datasource
grafana-cli plugins install crate-datasource
grafana-cli plugins install percona-percona-app
grafana-cli plugins install alexanderzobnin-zabbix-app
grafana-cli plugins install fastweb-openfalcon-datasource
grafana-cli plugins install raintank-kubernetes-app

mkdir /var/lib/grafana/dashboards
wget https://grafana.com/api/dashboards/1124/revisions/4/download -O /var/lib/grafana/dashboards/prometheus_snmp_network.json
wget https://grafana.com/api/dashboards/1666/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_bind.json
wget https://grafana.com/api/dashboards/2322/revisions/3/download -O /var/lib/grafana/dashboards/prometheus_elasticsearch.json
wget https://grafana.com/api/dashboards/3070/revisions/3/download -O /var/lib/grafana/dashboards/prometheus_etcd.json
wget https://grafana.com/api/dashboards/2525/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_logstash.json
wget https://grafana.com/api/dashboards/2121/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_rabbitmq.json
wget https://grafana.com/api/dashboards/2113/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_hystrix.json
wget https://grafana.com/api/dashboards/3901/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_php-fpm.json
wget https://grafana.com/api/dashboards/2040/revisions/4/download -O /var/lib/grafana/dashboards/prometheus_tidb.json
wget https://grafana.com/api/dashboards/2043/revisions/8/download -O /var/lib/grafana/dashboards/prometheus_tikv.json
wget https://grafana.com/api/dashboards/2037/revisions/4/download -O /var/lib/grafana/dashboards/prometheus_pd.json
wget https://grafana.com/api/dashboards/3457/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_jmx.json
wget https://grafana.com/api/dashboards/2949/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_nginx_vts.json
wget https://grafana.com/api/dashboards/926/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_ceph_pools.json
wget https://grafana.com/api/dashboards/923/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_ceph_osd.json
wget https://grafana.com/api/dashboards/917/revisions/1/download -O /var/lib/grafana/dashboards/prometheus_ceph_cluster.json

wget https://grafana.com/api/dashboards/2030/revisions/1/download -O /var/lib/grafana/dashboards/system_metrics.json

wget https://grafana.com/api/dashboards/2711/revisions/3/download -O /var/lib/grafana/dashboards/zabbix.json

wget https://grafana.com/api/dashboards/3244/revisions/1/download -O /var/lib/grafana/dashboards/kubernetes_calico.json
wget https://grafana.com/api/dashboards/741/revisions/1/download -O /var/lib/grafana/dashboards/kubernetes_deployment.json
wget https://grafana.com/api/dashboards/315/revisions/3/download -O /var/lib/grafana/dashboards/kubernetes.json
wget https://grafana.com/api/dashboards/405/revisions/6/download -O /var/lib/grafana/dashboards/kubernetes_node.json
wget https://grafana.com/api/dashboards/1860/revisions/9/download -O /var/lib/grafana/dashboards/kubernetes_node_full.json

wget https://grafana.com/api/dashboards/878/revisions/5/download -O /var/lib/grafana/dashboards/elasticsearch.json

wget https://grafana.com/api/dashboards/2292/revisions/5/download -O /var/lib/grafana/dashboards/nginx_access_log.json

wget https://github.com/percona/grafana-dashboards/archive/master.zip -O /tmp/percona.zip
cd /tmp && unzip /tmp/percona.zip
cp -r /tmp/grafana-dashboards-master/dashboards /var/lib/grafana/

chown -R grafana:grafana /var/lib/grafana

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server.service
sudo /bin/systemctl start grafana-server.service