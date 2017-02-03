
#### Kubernetes 101

![kubernetes logo](kube.png)

.sigblock[
Josh Berkus

Red Hat OSAS

FOSDEM 2017
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

## Microservice Django

1. PostgreSQL containers (w/ replicas)
2. pgbouncer container
3. Storage containers (Gluster)
4. Django containers
5. Webserver container (nginx)
6. Reverse proxy container
7. DB backup container
8. CI container

---

![microservices ad nauseum](microservice-hell.png)

---

![monolith](monolith.png)

---

## Microservice Coordination

* BASH?
* Puppet/Ansible?
* Custom Python/Ruby code?
* Typing real fast?

---

![containers together](containers-together.png)

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
* with external networks (web) <br />
  (also see Ingress)

---

#### But I need to configure my apps

---

## configuration

* dev vs. prod
* multi-tenant apps
* passwords
* performance settings

---

## configuration options

* ENV
* ConfigMap
* Secrets

---

#### What about stateful services?

---

## storage: volumes

* Volumes: local storage per node
* PersistentVolumes: shared storage on network storage

---

## beyond volumes: StatefulSet

* persistent pod identity
* pod addressability
* associate storage with specific pods

(see my preso State That's What's Happening)

---

#### Implementation Details

---

## how does all this work?

![kube architecture diagram](Kubernetes_components.jpg)

---

## etcd

* distributed consensus store
* holds metadata
* supports HA for Kube itself

---

## create & edit objects

* write direct to etcd
* kubectl one-liners
* kubectl + yaml files
* API + drivers (e.g. pyKube)

---

## other pieces (microservices)

* apiserver: provides API
* scheduler: places pods
* controller: starts/stops pods
* proxy/network: lets pods connect
* discovery: find pods by name
* dns: lets outside connect

---

## recap: what Kube does

* grouping: pods
* deployment: nodes
* scale-out: replicas
* sharing: services
* configuration
* storage: volumes

---

## recap: what Kube does

allows you to turn a set of containers into an application

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
March 26, Berlin

]

.leftlogo[![pgx logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
