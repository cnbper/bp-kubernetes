# apiserver

```shell
kubectl -n kube-system exec -it kube-apiserver-kube-master /bin/sh

kube-apiserver -h | grep enable-admission-plugins

PodNodeSelector

kubectl -n kube-system edit deployment kube-apiserver-kube-master

kubectl get pods -n kube-system kube-apiserver-kube-master -o yaml | grep PodNodeSelector
```