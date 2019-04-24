ISTIO_HOME=../istio-1.1.2
cd $ISTIO_HOME

kubectl label namespace default istio-injection=enabled
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
