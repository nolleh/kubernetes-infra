kubectl label namespace default istio-injection=enabled
kubectl apply -f istio-1.1.2/samples/bookinfo/platform/kube/bookinfo.yaml
