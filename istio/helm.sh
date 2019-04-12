ISTIO_HOME=istio-1.1.2

cd $ISTIO_HOME

kubectl apply -f install/kubernetes/helm/helm-service-account.yaml

helm init --service-account tiller --upgrade

helm install install/kubernetes/helm/istio-init --name istio-init --namespace istio-system

helm install install/kubernetes/helm/istio --name istio --namespace istio-system \
    --set kiali.enabled=true \
    --set "kiali.dashboard.jaegerURL=http://localhost:15030" \
    --set "kiali.dashboard.grafanaURL=http://localhost:15031" \
    --set tracing.enabled=true \
    --set grafana.enabled=true \
    --set servicegraph.enabled=true

kubectl apply -f ../gateway.yaml
