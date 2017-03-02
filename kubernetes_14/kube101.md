
#### Kubernetes 101

![kubernetes logo](kube.png)

.sigblock[
Josh Berkus

Red Hat OSAS

OSBridge 2016
]

.leftlogo[![rh logo](red_hat_dingbat.png)]

---

## Who this is for:

* know what Docker is
* maybe used containers in dev
* don't know much about orchestration

---

![keanu confused](Conspiracy-Keanu.jpg)

---

## Kubernetes: History

1. Google created OSS port of internal code
2. Made it compatible with Docker
3. Donated to CNCF as project
4. Red Hat, CoreOS contributing

---

![openshift logo](OpenShift-Logo.png)

### Powered by Kubernetes

---

#### microservices

---

#### One Container<br />One Service

---

#### One App<br />Many Containers

---

## Microservice Coordination

* coordinate multiple containers
* "utility" containers (storage etc.)

Bash scripts?  Puppet/Chef/Ansible?

---

![pea pods](pods.jpg)

### Pods

---

## What's a pod?

* Group of containers
* Deploy together
* Share an IP address, ports
* Share storage

---

#### How do I deploy my containers?

---

## deployment: nodes

* node == machine (hw/vm)
* several nodes in a cluster
* each node runs "kubelet"

---

#### I need to scale out

---

## scaling out: replicas

![replicas of postgres](failover_3.png)

---

## scaling out: replicas

* scale services with duplicate pods
* kubernetes "scheduler" places them

---

#### How do I access my apps?

---

## sharing: services

* with other pods in the cluster (DB)
* with external networks (web)

---

#### But I need to configure my apps

---

## configuration

* help defining service at runtime
* pass configuration vars to containers

---

## configuration options

* ENV
* ConfigMap
* Secrets (old)

---

#### What about stateful services?

---

## storage: volumes

* Volumes: local storage per node
* PersistentVolumes: shared storage on network storage

---

## how does all this work?

![kube architecture diagram](Kubernetes_components.jpg)

---

## what kube does

* grouping: pods
* deployment: nodes
* scale-out: replicas
* sharing: services
* configuration
* storage: volumes

---

## ¿questions?

.left-column[
more<br />jberkus:




more<br />events:
]

.right-column[
www.projectatomic.io<br />
@fuzzychef<br />
jberkus.github.io

KubeCon<br />
Nov 7, Seattle

Cloud Native PDX<br />Meetup
]

.leftlogo[![pgx logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
