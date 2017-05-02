## K2 Helm charts

This is a repository of Helm charts that could be useful for deploying a K2 cluster with the functionality your application requires.

For an introduction to Helm and how to use charts in your K2 application: [helm.sh](https://helm.sh/)

These charts are automatically linted and published with Jenkins CI to the CNCT Helm repo: [atlas.cnct.io](http://atlas.cnct.io/).

To install a chart with a K2 template yaml:

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
        name: kafka
        repo: atlas
        chart: kafka
        version: 0.1.0
```

To use helm locally in you cluster to install charts:

Run a command similar to:

docker run -v ~/:/root -it --rm=true -e HELM_HOME=/root/.kraken/YOURCLUSTER/.helm -e KUBECONFIG=/root/.kraken/YOURCLUSTER/admin.kubeconfig quay.io/samsung_cnct/k2:latest helm list

With locally installed kubectl:

export KUBECONFIG=~/.kraken/YOURCLUSTER/admin.kubeconfig
`helm list --home ~/.kraken/YOURCLUSTER/.helm`
