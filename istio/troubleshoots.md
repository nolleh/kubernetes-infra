# Trobleshoots

$ kubectl -n kube-system delete deployment tiller-deploy
$ kubectl -n kube-system delete service/tiller-deploy

## error: SchemaError(io.k8s.api.apps.v1beta2.ControllerRevision)

### Error 
```bash
$ error: SchemaError(io.k8s.api.apps.v1beta2.ControllerRevision): invalid object doesn't have additional properties
```
https://github.com/kubernetes/kubernetes/issues/73111


### Solution
```bash
$ rm /usr/local/bin/kubectl
$ brew link --overwrite kubernetes-cli
```
