## A Helm Chart to Install the gci-iptables-conf-agent package
A Helm Chart to Install the gci-iptables-conf-agent package to a Kubernetes cluster as a DeamonSet.  
The iptables configuration agent's purpose is to rewrite the GKE node's host iptables to enable 
interoperation with a GCP VPN configured to transit taffic between to RFC 1918 address spaces. 

## Installation
Install this system in your cluster with [Helm](https://github.com/kubernetes/helm) with: 

```
$ helm repo add cnct http://atlas.cnct.io
$ helm install cnct/gci-iptables-conf-agent
```
Get the source for the [cnct-iptables-conf-agent](https://github.com/samsung-cnct/gci-iptables-conf-agent).

Get Helm [here](https://github.com/kubernetes/helm/blob/master/docs/install.md).

Get [K2](https://github.com/samsung-cnct/k2) to help you deploy a Kubernetes cluster.

## Credits

Created and maintained by the Samsung Cloud Native Computing Team.
