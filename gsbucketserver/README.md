# GS Bucket Server

##### The purpose of this chart is to serve up files in a Google Storage bucket through a web server.  Google Storage will allow you to expose the files through http over the internet, but not privately.  There is also limited control over how files are cached.  This chart gives more flexibility by setting up a private nginx server to control file access.  This chart is designed to run in GKE which allows gcsfuse to work seemelssly with creating certificates or service accounts.  If not using GKE you will need to set that up yourself.

##### The chart image is a base nginx container with gcsfuse added.

### Usage

```bash

helm repo add cnct http://atlas.cnct.io
helm install cnct/gsbucketserver
```

### Configurable Properties

##### Configurable properties are held within the `values.yaml` file in the root of this directory

<table>
    <thead>
        <tr>
            <th><sub>Property</sub></th>
            <th><sub>Description</sub></th>
            <th><sub>Type</sub></th>
            <th><sub>Default</sub></th>
            <th><sub>Accepted Values</sub></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><sub>replicaCount</sub></td>
            <td><sub>This is the number of replica pods you'd like the service to create.</sub></td>
            <td><sub>numeric</sub></td>
            <td><sub>1</sub></td>
            <td><sub>Any number value.</sub></td>
        </tr>
        <tr>
            <td><sub>nginx.rootDirectory</sub></td>
            <td><sub>This is the root directory nginx will set in it's configuration.</sub></td>
            <td><sub>string</sub></td>
            <td><sub>/usr/share/nginx/html</sub></td>
            <td><sub>Any path on the pod that you want nginx to serve as the root directory.</sub></td>
        </tr>
        <tr>
            <td><sub>nginx.autoIndex</sub></td>
            <td><sub>This tells nginx whether to treat the root directory as a traditional indexed folder.</sub></td>
            <td><sub>string</sub></td>
            <td><sub>off</sub></td>
            <td><sub>"off" or "on"</sub></td>
        </tr>
        <tr>
            <td><sub>gcsfuse.bucketName</sub></td>
            <td><sub>This is the Google Cloud Storage bucket name you want to mount.</sub></td>
            <td><sub>string</sub></td>
            <td><sub>changeme</sub></td>
            <td><sub>Any GCS bucket name your pod will have access to.</sub></td>
        </tr>
        <tr>
            <td><sub>gcsfuse.mountDirectory</sub></td>
            <td><sub>This is the directory on the pod that will be mounted with your GCS bucket specified.</sub></td>
            <td><sub>string</sub></td>
            <td><sub>/usr/share/nginx/html</sub></td>
            <td><sub>Any path on the pod that you'd like your GCS bucket to be mounted to.</sub></td>
        </tr>
    </tbody>
</table>

### Sample

##### This small sample helm command will startup a gsbucketserver, setting some of the other properties inline.

```
helm install . --name=bucket-server --namespace=production --set nginx.autoIndex=on,nginx.rootDirectory=/var/www/,gcsfuse.bucketName=my-gcs-bucket,gcsfuse.mountDirectory=/var/www/
```