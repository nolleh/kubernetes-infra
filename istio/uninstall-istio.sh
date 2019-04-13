ISTIO_HOME=istio-1.1.2

cd $ISTIO_HOME

helm template install/kubernetes/helm/istio --name istio --namespace istio-system | kubectl delete -f -
kubectl delete namespace istio-system