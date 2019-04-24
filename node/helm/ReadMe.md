# Helm Chart
[Ref](https://sktelecom-oslab.github.io/Virtualization-Software-Lab/Helm/)

node/
  Chart.yaml          # Chart에 대한 정보를 적어놓는 YAML 파일 (필수)
  LICENSE             # 라이센스에 대한 내용을 적어 놓는 텍스트 파일 (옵션)
  README.md           # 사용자가 읽을 수 있는 README 파일 (옵션)
  requirements.yaml   # Chart간 의존성이 있을 경우 이를 리스트 형태로 정의하는 파일 (옵션)
  values.yaml         # Chart 내에서 어플리케이션에 필요한 설정값들이 모여 있는 파일 (필수)
  charts/             # Chart가 다른 Chart에 의존성이 있을 경우 다른 의존하는 Chart들이 위치하는 디렉토리 (옵션)
  templates/          # kubernetes 객체를 정의하는 manifest template 파일들이 위치하는 디렉토리 (필수)
                      # gotpl로 구현된 template들이어야 하며 values.yaml의 값들과 합해져서 manifest 파일을 rendering함
  templates/NOTES.txt # chart 사용 방법을 설명해 놓은 텍스트 파일 (옵션)


## dependency ?

B-Namespace
A-Namespace
B-Service
A-Service
B-ReplicaSet
A-StatefulSet

> 즉, 두 chart 를 하나의 set 으로 합치되 의존하는 chart 를 먼저 생성한다. [sorting](https://github.com/kubernetes/helm/blob/master/pkg/tiller/kind_sorter.go#L26)