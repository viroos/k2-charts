# GS Bucket Server

### The purpose of this chart is to serve up files in a Google Storage bucket through a web server.  Google Storage will allow you to expose the files through http over the internet, but not privately.  There is also limited control over how files are cached.  This chart gives more flexibility by setting up a private nginx server that servers up the files in your bucket.  This chart is designed to run in GKE which allows gcsfuse to work seemelssly with creating certificates or service accounts.  If not using GKE you will need to set that up yourself.

### The chart image is a base nginx container with gcsfuse added.

##Usage

```bash

helm repo add cnct http://atlas.cnct.io
helm install cnct/gsbucketserver

```