ISTIO_HOME=../istio-1.1.2
cd $ISTIO_HOME

kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
