#!/usr/bin/env bash
set -x
trap read debug

cat /etc/yum.repos.d/jasonbrooks-kube-release-epel-7.repo

rpm-ostree status

rpm-ostree pkg-add --reboot kubelet kubeadm kubectl kubernetes-cni

rpm-ostree status

start the kubelet

systemctl enable kubelet.service --now

kubeadm init --skip-preflight-checks

kubectl taint nodes --all dedicated-

kubectl apply -f https://git.io/weave-kube

kubectl get pods --all-namespaces
