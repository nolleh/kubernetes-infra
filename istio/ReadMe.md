# Istio
## Install Step

### 1. helm install
https://helm.sh/docs/using_helm/#installing-helm

```
tar -xzvf helm-v2.13.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

### 2. istio install
https://istio.io/docs/setup/kubernetes/download/

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.2 sh -
