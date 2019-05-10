# 获取k8s admin token
kubectl -n kube-system describe secret `kubectl -n kube-system get secret|grep admin-token|cut -d " " -f1`|grep "token:"|tr -s " "|cut -d " " -f2

# 删除node
## 封锁kube-node1，排干node上的pod
kubectl drain kube-node1 --delete-local-data --force --ignore-daemonsets
## 删除kube-node1节点
kubectl delete node kube-node1
## 在kube-node1上执行
kubeadm reset
## 卸载网卡
ifconfig cni0 down && ip link delete cni0 && ifconfig flannel.1 down && ip link delete flannel.1 && rm -rf /var/lib/cni/

# 重新加入集群
kubeadm token create --print-join-command

# 合并多个集群配置文件
KUBECONFIG=cluster1:cluster2 kubectl config view --flatten