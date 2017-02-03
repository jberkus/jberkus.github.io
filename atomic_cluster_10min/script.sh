
# flip to browser, show AWS nodes
# flip back to terminal

cat /etc/yum.repos.d/jasonbrooks-kube-release-epel-7.repo

rpm-ostree status

rpm-ostree pkg-add --reboot kubelet kubeadm kubectl kubernetes-cni

rpm-ostree status

#start the kubelet

systemctl enable kubelet.service --now

kubeadm init --skip-preflight-checks

kubectl taint nodes --all dedicated-

kubectl apply -f https://git.io/weave-kube

kubectl get pods --all-namespaces

# switch to another node

rpm-ostree pkg-add --reboot kubelet kubeadm kubernetes-cni

systemctl enable kubelet --now

kubeadm join

# switch to another node

systemctl enable kubelet --now

kubeadm join

# switch to another node

systemctl enable kubelet --now

kubeadm join

atomic run cockpit/ws

# switch back to master

kubectl get nodes

kubectl create -f guestbook.yaml

kubectl get pods

# switch to browser, show guestbook

# switch to local machine

less install_kubeadm_new.yaml

# show manifests

# show security setup

# talk about limitations, plans
