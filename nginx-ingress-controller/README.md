# A Helm Chart for an Nginx Ingress Controller

## Installation
Install this in your cluster with [Helm](https://github.com/kubernetes/helm):

```
helm repo add cnct http://atlas.cnct.io
helm install cnct/nginx-ingress-controller
```

or install this chart as part of your [K2](https://github.com/samsung-cnct/k2cli) config under helmConfigs.charts:

```
      - name: nginx-ingress-controller
        repo: atlas
        chart: nginx-ingress-controller
        version: 0.1.1
        namespace: kube-auth
        values:
          replicas: 2
```

## Values

Customize your installation by customizing these default values:

**backendImage** (default: "gcr.io/google_containers/defaultbackend:1.0")

  This is a a simple webserver that satisfies the ingress, which means it has to do two things:

   Serves a 404 page at /
   Serves 200 on a /healthz

**bodySize** (default: "64m")

  A 413 error will be returned to the client when the size in a request
  exceeds the maximum allowed size of the client request body. This size
  can be configured by this parameter.

**externalName**

  For a serviceType of ExternalNames the service is mapped to the contents
  of the externalName field (e.g. foo.bar.example.com), by returning a
  CNAME record with its value. No proxying of any kind is set up.

**hstsIncludeSubdomains** (default: "false")

  Set HTTP Strict Transport Security to allow cookies to be valid for
  subdomains (setting this to true is insecure).

**image** (default: "gcr.io/google_containers/nginx-ingress-controller:0.8.3")

  The image used for the nginx ingress controller

**loadBalancerIP**

  Some cloud providers allow the loadBalancerIP to be specified. In
  those cases, the load-balancer will be created with the user-specified
  loadBalancerIP. If the loadBalancerIP field is not specified, an
  ephemeral IP will be assigned to the loadBalancer. If the loadBalancerIP
  is specified, but the cloud provider does not support the feature,
  the field will be ignored.


**proxyConnectTimeout** (default: "15")

  Defines a timeout for establishing a connection with a proxied server.

**proxyReadTimeout** (default: "600")

  Defines a timeout for reading a response from the proxied server. The
  timeout is set only between two successive read operations, not for the
  transmission of the whole response. If the proxied server does not
  transmit anything within this time, the connection is closed.

**proxySendTimeout** (default: "600")

  Sets a timeout for transmitting a request to the proxied server. The
  timeout is set only between two successive write operations, not for the
  transmission of the whole request. If the proxied server does not
  receive anything within this time, the connection is closed.

**replicas** (default: "1")

  The number of pods in the replica set.

**serverNameHashBucketSize** (default: "256")

  Sets the bucket size for the server names hash tables. The default value
  depends on the size of the processor's cache line.

**serviceType** (default: "LoadBalancer")

  The kubernetes service type. See the kubernetes documentation for [service types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services---service-types)
