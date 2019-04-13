ISTIO_HOME=../istio-1.1.2
cd $ISTIO_HOME

for i in install/kubernetes/helm/istio-init/files/crd*yaml; 
  do kubectl apply -f $i; 
done

kubectl apply -f install/kubernetes/istio-demo.yaml
