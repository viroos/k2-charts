## Centralize Logging for Kubernetes Cluster
This is a centralized logging solution for a production grade Kubernetes cluster. This system ensures events are safely pulled from pods, enriched with Kubernetes metadata, saved in a data store and made available for visualizing and querying - without ever leaving the kubernetes cluster.

## Installation
Install this system in your cluster with [Helm](https://github.com/kubernetes/helm) with:

```$ helm repo add cnct http://atlas.cnct.io```
```$ helm install cnct/central-logging```

Get Helm [here](https://github.com/kubernetes/helm/blob/master/docs/install.md).

Or add the following to your [K2](https://github.com/samsung-cnct/k2) configuration template:

```  
helmConfigs:
  - &defaultHelm
    name: defaultHelm
    kind: helm
    repos:
        -
          name: atlas
          url: http://atlas.cnct.io
      charts:
        -
          name: central-logging
          repo: atlas
          chart: central-logging
          version: 0.2.0
```

Update the count of clusterNodes to 6 and update the providerConfig.type to m4.xlarge

Get [K2](https://github.com/samsung-cnct/k2) to help you deploy a Kubernetes cluster.

## Assets
Assets for each component in the centralized logging system including github repo, quay repo and helm chart.

**On Node Collector:** A FluentD daemonset is responsible for collecting logs from applications on pods.
Github Repo: https://github.com/samsung-cnct/k2-logging-fluentd-daemonset
Image: https://quay.io/repository/samsung_cnct/fluentd_daemonset
Helm Chart: https://github.com/samsung-cnct/k2-charts/tree/master/daemon-fluentd

**Log Transport Bus:** Kafka
* Github Repo: https://github.com/samsung-cnct/kafka-kubernetes
* Monitor Github Repo: https://github.com/samsung-cnct/kafka-monitor-kubernetes
* Image: https://quay.io/repository/samsung_cnct/kafka-petset
* Monitor Image: https://quay.io/repository/samsung_cnct/kubernetes-kafka-monitor
* Helm Chart: https://github.com/samsung-cnct/k2-charts/tree/master/kafka

**Processing Node:** FluentD, will centrally process events
* Github Repo: https://github.com/samsung-cnct/k2-logging-central-fluentd
* Image: https://quay.io/repository/samsung_cnct/fluentd-central
* Helm Chart: https://github.com/samsung-cnct/k2-charts/tree/master/central-fluentd

**Queryable Datastore:** ElasticSearch
* Github Repo: https://github.com/samsung-cnct/k2-charts/tree/master/elasticsearch
* Image: https://quay.io/repository/samsung_cnct/elasticsearch
* Helm Chart: https://github.com/samsung-cnct/k2-charts/tree/master/elasticsearch

**Data Visualization:** Kibana
* Github Repo: https://github.com/samsung-cnct/kibana-k2-dependencies
* Image: https://hub.docker.com/_/kibana/ version: 5.0.2
* Helm Chart: https://github.com/samsung-cnct/k2-charts/tree/master/kibana

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

Created and maintained by the Samsung Cloud Native Computing Team.
