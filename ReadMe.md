# Kubernetes PlayGroud
in wsl(ubuntu18.04)

## Overview
- istio
  - sample
- elk
- node
- redis

## PreRequisions
### 1. gcloud SDK 
https://cloud.google.com/sdk/downloads

```
tar -xvzf google-cloud-sdk-183.0.0-linux-x86_64.tar.gz

./google-cloud-sdk/install.sh
```

```
gcloud auth login
gcloud config set project PROJECT_ID
gcloud components update

# if there is some trouble, do gcloud init
```

### 2. kubectl

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl
```


### 3. kubectl config to GKE
[gcp introduction](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl)

```
gcloud container clusters get-credentials --zone [zone] [CLUSTER_NAME]
```

#### 3-1. TroubleShoot

##### container.clusters.get permission
ERROR: (gcloud.container.clusters.get-credentials) ResponseError: code=403, message=Required "container.clusters.get" permission(s) for "projects/gcp-test/zones/asia-northeast1-a/clusters/standard-cluster-1". See https://cloud.google.com/kubernetes-engine/docs/troubleshooting#gke_service_account_deleted for more info

> gcloud config set container/use_client_certificate True

> gcloud components update

> gcloud init


##### 'client' cannot list pods
Error from server (Forbidden): pods is forbidden: User "client" cannot list pods

> kubectl create rolebinding client-user-rolebinding --clusterrole=admin --user=$(gcloud config get-value account)


## Debug Envoy
envoy admin page 
```
kubectl -n istio-system port-forward [INGRESS-POD] 15000
```
istio-injection 

```
kubectl label namespace dev istio-injection=enabled
kubectl get namespace -L istio-injection
```