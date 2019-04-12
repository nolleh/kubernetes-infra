for i in istio-1.1.2/install/kubernetes/helm/istio-init/files/crd*yaml; 
  do kubectl apply -f $i; 
done

kubectl apply -f istio-1.1.2/install/kubernetes/istio-demo.yaml
