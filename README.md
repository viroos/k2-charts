# A Helm Chart for an nginx powered Ingress Controller

### Source of Material
Grabbed from [github.com/kubernetes/ingress](https://github.com/kubernetes/ingress/tree/master/examples/rbac/nginx)

### Note for RBAC-enabled clusters

Tiller requires special privileges in order to create the RBAC roles.  Giving tiller admin rights is sufficient.

If you are unsure, you may need to review [this helm issue](https://github.com/kubernetes/helm/issues/2224)

## Installation

Install this in your cluster with [Helm](https://github.com/kubernetes/helm):

```
helm repo add cnct http://atlas.cnct.io
helm install cnct/nginx-ingress
```

or install this chart as part of your [K2](https://github.com/samsung-cnct/k2cli) config under helmConfigs.charts:

```
      - name: nginx-ingress
        repo: atlas
        chart: nginx-ingress-controller
        version: 0.1.0
        namespace: nginx-ingress
        values:
          ingressController:
            replicas: 2
```

## Values

Customize your installation by customizing these default values:

### configuration block

**`configuration.bodySize`** (default: `64m`)

  A 413 error will be returned to the client when the size in a request
  exceeds the maximum allowed size of the client request body. This size
  can be configured by this parameter.

**`configuration.hstsIncludeSubdomains`** (default: `false`)

  Set HTTP Strict Transport Security to allow cookies to be valid for
  subdomains (setting this to true is insecure).

**`configuration.proxyConnectTimeout`** (default: `15`)

  Defines a timeout for establishing a connection with a proxied server.

**`configuration.proxyReadTimeout`** (default: `600`)

  Defines a timeout for reading a response from the proxied server. The
  timeout is set only between two successive read operations, not for the
  transmission of the whole response. If the proxied server does not
  transmit anything within this time, the connection is closed.

**`configuration.proxySendTimeout`** (default: `600`)

  Sets a timeout for transmitting a request to the proxied server. The
  timeout is set only between two successive write operations, not for the
  transmission of the whole request. If the proxied server does not
  receive anything within this time, the connection is closed.

**`configuration.serverNameHashBucketSize`** (default: `256`)

  Sets the bucket size for the server names hash tables. The default value
  depends on the size of the processor's cache line.

### ingressController
These are parameters for the actual ingress controller (nginx)

**`ingressController.image`** (default: `gcr.io/google_containers/nginx-ingress-controller`)

  The image used for the nginx ingress controller

**`ingressController.version`** (default: `0.9.0-beta8`)

  This is version number of the ingress controller

**`ingressController.replicas`** (default: `2`)

  This is the number of nginx ingress containers that should be spun up
  
**`ingressController.ports`** (default: _ports 80 and 443_)

  This is an array of ports that should be handled by the ingress controller
  
  They are represented by an array similar to:
  
  ```yaml
  ports:
  - name: http
    number: 80
  - name: https
    number: 443
```

### defaultBackend

Configuration for the default backend webserver

**`defaultBackend.image`** (default: `gcr.io/google_containers/defaultbackend`)

  This is a a simple webserver that satisfies the ingress, which means it has to do two things:

   Serves a 404 page at /
   Serves 200 on a /healthz

**`defaultBackend.version`** (default: `1.0`)

  This is the version number of the aforementioned image

**`defaultBackend.replicas`** (default: `1`)

  This is how many replicas of the default backend web server should be available at any given time
  
**`defaultBackend.resources`** (default: `10m` CPU, `20Mi` Memory)

  This is a block of variables representing how much resources should be given to the default backend webserver
  
  ```yaml
  resources:
    memory: 20Mi
    cpu: 10m
  ```

### ingressService

Configuration for the ingress service

**`ingressService.type`** (default: `LoadBalancer`)

  The kubernetes service type. See the kubernetes documentation for [service types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services---service-types)

**`ingressService.nodePorts`** (default: `null`)

  Should you need to map node ports to ingress service ports, this configuration block will allow you to do so.
  
  ```yaml
  nodePorts:
  - name: http
    port: 8080
    targetPort: 80
    protocol: TCP
  - name: https
    port: 8443
    targetPort: 443
    protocol: TCP
  ```
  
  If you are using `ingressService.type` as `LoadBalancer` this setting is most likely ignorable.

**`ingressService.externalName`** (default: `null`)

  For a serviceType of ExternalNames the service is mapped to the contents
  of the externalName field (e.g. foo.bar.example.com), by returning a
  CNAME record with its value. No proxying of any kind is set up.

**`ingressService.loadBalancerIP`** (default: `null`)

  Some cloud providers allow the loadBalancerIP to be specified. In
  those cases, the load-balancer will be created with the user-specified
  loadBalancerIP. If the loadBalancerIP field is not specified, an
  ephemeral IP will be assigned to the loadBalancer. If the loadBalancerIP
  is specified, but the cloud provider does not support the feature,
  the field will be ignored.


