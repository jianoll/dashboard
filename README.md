
- install
```
    wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.1.2-1486989747.x86_64.rpm 
    sudo yum localinstall grafana-4.1.2-1486989747.x86_64.rpm 
    #grafana-cli plugins list-remote
    
    grafana-cli plugins install stagemonitor-elasticsearch-app 
    grafana-cli plugins install grafana-openfalcon-datasource 
    grafana-cli plugins install raintank-kubernetes-app 
    grafana-cli plugins install abhisant-druid-datasource 
    grafana-cli plugins install foursquare-clouderamanager-datasource 
    grafana-cli plugins install praj-ams-datasource 
    grafana-cli plugins install percona-percona-app 
    grafana-cli plugins install alexanderzobnin-zabbix-app
```

- grafana dashboards
```
    https://github.com/percona/grafana-dashboards/tree/master/dashboards
    https://github.com/jimmidyson/prometheus-grafana-dashboards
    https://github.com/life360/prometheus-grafana-dashboards/tree/master/cassandra
    https://grafana.com/dashboards
   https://github.com/hammerlab/grafana-spark-dashboards
```