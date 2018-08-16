## Kubernetes on CentOS

![kube on centos](kube_on_cent.png)

.sigblock[
Josh Berkus

Red Hat OSAS

CentOS Dojo Boston
]

.leftlogo[![redhat logo](red_hat_dingbat.png)]

---

## goals

Quickly & easily set up a test system for Kubernetes

---

## what about ....

![openshift logo](OpenShift-Logo.png)

---

## ... Openshift?

Great production system, but ...

* complex to set up (openshift-ansible)
* trails Kubernetes development (~~ 6 months)

... try Kubernetes, deploy Openshift

---

## let's set it up!

---

## next steps

* HA (master stacking or etcd external)
* Storage (Persistent Volumes)
* Load balancing

---

## why kubeadm?

* Simplest/easiest
* Cloud and bare metal
* Rapid progress
* Upgrade support
* Atomic/CoreOS compatible
* Newest versions

---

## kubeadm limitations

* storage setup
* cloud provider
* HA setup

---

## alternate installs

* Kubespray (Ansible)
* Kubicorn (GO, cloud only)

---

# ¿questions?

.left-column-narrow[
more<br />jberkus:

Scripts:

&nbsp;
]

.right-column-wide[
@fuzzychef<br />
jberkus.github.io

github.com/jberkus/<br />
/centos-kubernetes

&nbsp;
]

.leftlogo[![rh logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
