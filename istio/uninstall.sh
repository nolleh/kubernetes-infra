ISTIO_HOME=istio-1.1.2

cd $ISTIO_HOME

helm del --purge istio
helm del --purge istio-init

kubectl delete -f install/kubernetes/helm/istio-init/files