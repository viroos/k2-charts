## A Helm Chart for Hashicorp Consul

## Installation
Install this in your cluster with [Helm](https://github.com/kubernetes/helm):

```
helm repo add cnct http://atlas.cnct.io
```
```
helm install cnct/consul
```

Get Helm [here](https://github.com/kubernetes/helm/blob/master/docs/install.md).

Or add the following to your [K2](https://github.com/samsung-cnct/k2) configuration template:
```
clusterServices:
  repos:
    -
      name: atlas
      url: http://atlas.cnct.io
  services:
    -
      name: consul
      repo: atlas
      chart: consul
      version: 0.1.0
      namespace: kube-system
      values:
        Consul:
          MasterToken: <Your Master Token>
```

Get [K2](https://github.com/samsung-cnct/k2) to help you deploy a Kubernetes cluster.

## Assets
Kubernetes Assets in the chart.

**Consul**

A tool for service discovery, monitoring and configuration.

See detail in [official site](https://www.consul.io)

default values below

```
Consul:
  Image: "quay.io/keyolk/consul"
  ImageTag: "0.6.3"
  ImagePullPolicy: "Always"
  Component: "consul"

  Replicas: 3
  Environment: "local"
  MasterToken: "token"
  GossipKey: "cg8StVXbQJ0gPvMd9o7yrg=="

  Cpu: "512m"
  Memory: "200Mi"
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credit

Created and maintained by the Samsung Cloud Native Computing Team.
