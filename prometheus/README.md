# Deprecated

This chart has been deprecated. Please see https://kubeapps.com/charts/stable/prometheus for a possible replacement chart.

# Usage

The Prometheus Service is exposed as a [NodePort](http://kubernetes.io/docs/user-guide/services/#type-nodeport) type Kubernetes Service. Users typically interact with it through a proxied endpoint. When using k2 on AWS, each master node is behind an ELB. To determine the CNAME for the ELB use kubectl. For example:

```
rodin:charts dwat$ kubectl cluster-info
Kubernetes master is running at https://alien-lzdyGMV-master-elb-1937207779.us-east-1.elb.amazonaws.com

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
rodin:charts dwat$
```

Then a list of metrics monitored by Prometheus can be accessed at <https://alien-lzdygmv-master-elb-1937207779.us-east-1.elb.amazonaws.com/api/v1/proxy/namespaces/default/services/prometheus:prometheus/metrics> And graphs may be created through <https://alien-lzdygmv-master-elb-1937207779.us-east-1.elb.amazonaws.com/api/v1/proxy/namespaces/default/services/prometheus:prometheus/graph> though it is recommended that you install and use Grafana instead.

Prometheus provides a functional expression language PromQL that lets the user select and aggregate time series data. See [query language documention](https://prometheus.io/docs/querying/basics/) and [examples](https://prometheus.io/docs/querying/examples/) for more information.

More information on manually constructing proxied URLs can be found [here](http://kubernetes.io/docs/user-guide/accessing-the-cluster/#manually-constructing-apiserver-proxy-urls)

