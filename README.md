#dashboards metric展示
- 可做成公司级的指标dashboard

# 功能
```
1,支持spark metric
2,支持zabbix数据源
3,支持Prometheus 
4,支持nginx access_log 和es自身监控
5,支持Graphite
6,大数据组件的dashboard的数据源推荐ambari_metrics 具体见 https://github.com/xiaomatech/bigdata
```

# 安装
```bash
    wget https://raw.githubusercontent.com/xiaomatech/dashboard/master/install.sh
   
    #修改对应的 resourcemanager_url carbon_relay_host
    
    bash install.sh
```
#参考 
- http://docs.grafana.org/
- https://kiswo.com/article/1021