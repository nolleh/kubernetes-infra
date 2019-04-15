# Kubernetes PlayGroud
in wsl(ubuntu18.04)

## Overview
- istio
  - sample
- node
- redis

## Install Step
0. gcloud SDK 
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

1. kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl

2. kubectl config to GKE
[gcp introduction](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl)

gcloud container clusters get-credentials --zone [zone] [CLUSTER_NAME]


ERROR: (gcloud.container.clusters.get-credentials) ResponseError: code=403, message=Required "container.clusters.get" permission(s) for "projects/gcp-test/zones/asia-northeast1-a/clusters/standard-cluster-1". See https://cloud.google.com/kubernetes-engine/docs/troubleshooting#gke_service_account_deleted for more info
> gcloud config set container/use_client_certificate True

> gcloud components update

> gcloud init


Error from server (Forbidden): pods is forbidden: User "client" cannot list pods

> kubectl create rolebinding client-user-rolebinding --clusterrole=admin --user=$(gcloud config get-value account)


3. helm install
https://helm.sh/docs/using_helm/#installing-helm

```
tar -xzvf helm-v2.13.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

4. istio install
https://istio.io/docs/setup/kubernetes/download/

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.2 sh -