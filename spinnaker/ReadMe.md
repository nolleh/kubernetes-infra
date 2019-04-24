# Ingress
---
클러스터로의 외부접근제어 (http)
- 로드밸런싱 / SSL termination, 이름 기반 버츄얼호스팅

## Terminology
---
- 클러스터: 쿠버네티스에 의해 관리되는 방화벽이 세워진 노드의 그룹
- 엣지라우터: 방화벽 정책을 강제하는 라우터. 클라우드


# SetupGuide 

Setup guide: https://www.spinnaker.io/setup/
1. Install Halyard
2. Choose a cloud provider
3. Choose an environment
4. Choose a storage service
5. Deploy Spinnaker
6. Back up your config
7. Configure everything else (which includes a lot of stuff you need before you can use Spinnaker in production)
8. Productionize Spinnaker (which mainly helps you configure Spinnaker to scale for production)

## 1. Install Halyard
CLI tool for spinnaker deployments.

### 1-1 Debian / Ubuntu / MacOS

*ubuntu*
```
curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/debian/InstallHalyard.sh
```

*mac*
```
curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/macos/InstallHalyard.sh
```

- install
```
sudo bash InstallHalyard.sh
```

- apply
```
. ~/.bashrc
```

- update
```
sudo update-halyard
```

## 2. CloudProvider - GKE
Update kubectl - refer root readme.md file

```bash
CONTEXT=$(kubectl config current-context)

# This service account uses the ClusterAdmin role -- this is not necessary, 
# more restrictive roles can by applied.
kubectl apply --context $CONTEXT \
    -f https://spinnaker.io/downloads/kubernetes/service-account.yml

TOKEN=$(kubectl get secret --context $CONTEXT \
   $(kubectl get serviceaccount spinnaker-service-account \
       --context $CONTEXT \
       -n spinnaker \
       -o jsonpath='{.secrets[0].name}') \
   -n spinnaker \
   -o jsonpath='{.data.token}' | base64 --decode)

kubectl config set-credentials ${CONTEXT}-token-user --token $TOKEN

kubectl config set-context $CONTEXT --user ${CONTEXT}-token-user
```

## 3. Choose Env
where to deploy ?

## 4. Choose a storage service
- service account to authenticate as against GCP 
- halyard to create buckets!

### 5. Deploy
- deploy


### Question
1. 왜 나는 어플리케이션에 이렇게 많이 나오지 ?
2. createted / update / owner 정보 등은?

