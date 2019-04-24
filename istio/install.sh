ISTIO_HOME=istio-1.1.2

cd $ISTIO_HOME

kubectl apply -f install/kubernetes/helm/helm-service-account.yaml

#helm init --service-account tiller
helm init --service-account tiller --upgrade

helm install install/kubernetes/helm/istio-init --name istio-init --namespace istio-system

KIALI_USERNAME=$(echo -n nolleh | base64)
KIALI_PASSPHRASE=$(echo -n nolleh | base64)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kiali
  namespace: istio-system
  labels:
    app: kiali
type: Opaque
data:
  username: $KIALI_USERNAME
  passphrase: $KIALI_PASSPHRASE
EOF

if [ "$1" == "--mini" ]; then
  echo "mini use of resource"
  helm install install/kubernetes/helm/istio --name istio --namespace istio-system \
      --set mixer.telemetry.resources.request.memory="512Mi" \
      --set pilot.resources.requests.memory="512Mi" \
      --set kiali.enabled=true \
      --set tracing.enabled=true \
      --set jaeger.enabled=false \
      --set grafana.enabled=false \
      --set servicegraph.enabled=true
else
  echo "full use of resource"
  helm install install/kubernetes/helm/istio --name istio --namespace istio-system \
      --set kiali.enabled=true \
      --set tracing.enabled=true \
      --set "kiali.dashboard.jaegerURL=http://localhost:15030" \
      --set "kiali.dashboard.grafanaURL=http://localhost:15031" \
      --set jaeger.enabled=true \
      --set grafana.enabled=true \
      --set servicegraph.enabled=true
      # --set gateways.istio-ingressgateway.ports[9].targetPort=15034 \
      # --set gateways.istio-ingressgateway.ports[9].name=http \
      # --set gateways.istio-ingressgateway.ports[9].nodePort=15034
fi

kubectl apply -f ../gateway.yaml