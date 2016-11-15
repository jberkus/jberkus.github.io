background-image: url(elephant-shelter.jpg)

#### Containerized Clustered PostgreSQL

.sigblock[
Josh Berkus

Red Hat OSAS

pgConfSV 2016
]

.leftlogo[![redhat logo](red_hat_dingbat.png)]

---

github.com/jberkus/atomicdb

---

![yak shaving](yak_shaving.jpg)

### A Long Strange Journey

---

![automated elephant](automated_elephant.jpg)

---

![docker logo](docker_logo.png)

---

>The way containers are designed, and particularly the way Docker is designed, the assumption is that the container is stateless. -- Mark Davis, ClusterHQ

---

![incomplete escalator](halfway_there.jpg)

---

![project atomic](project_atomic.png)

---

.left-column[

![kubernetes logo](kube.png)

]

.left-column[

![elephant plus pets](elephant-pet.jpg)

]

---

## PetSet / StatefulSet

Kubernetes API for stateful applications,
introduced in 1.4 (still alpha)

* storage
* routing
* identity
* persistence

---

#### Why Containerize?

---

## Pro-container

* easy install/configure
* service encapsulation
* prevent "hot-fixes"
* ease of dev and testing
* orchestration

---

## Pro-orchestration

* auto-vivification
* deploy & configure in groups
* manage routing
* built-in HA/DR
* self-service for devs
* manage everything in one place

---

_manage PostgreSQL<br />as a cluster ecosystem,<br />instead of as<br />a bunch of servers_

---

## Anti-container

* extra setup
* change admin, config, monitorning tools
* possible performance issues
* no efficiency benefit for databases
* _everything is alpha_

---

This is your _future_ infrastructure.

---

#### Enough Talking,<br />Let's See Some Code!

---

![micro cluster](micro-cluster.jpg)

---

## Prototypeishness

* still working on some of the alpha features
* some productions examples exist already (Spilo)
* others in ~~ 6 months

---

![robot](bot-traffic.jpg)

### Bots Not Cattle

---

![autopilot](Autopilot.jpg)

### Autopilot Pattern

---

## Bots/Autopilots

Each containerized application is programmed
using a simple state machine
to be an intelligent part of a clustered
ecosystem.

---

## Container Considerations

* log to stdout/stderr
* need bootstrap script
* install config, hba
* set up initial users

---

## PV or Not PV?

* Big Databases: want persistent volumes
* Small Databases: use ephemeral storage, make lots of replicas.

---

#### Productionizing

---

## Add to Patroni/Citus

* Persistent Volume configs
* Vault support
* Sidecar containers (backup, admin)
* Failover for query node
* Failover for shards

---

## More Clusters!

* New Governor
* Postgres Pro MM Clustering
* BDR (with Federation?)
* PostgresXL

---

## Waiting for Kube

* Union ConfigMap
* Federated StatefulSets
* Node Affinity (1.5)
* Fix issues (PVs, etc.)
* Vault plugin

---

#### Pull Requests Welcome!

github.com/jberkus/atomicdb

---

## Resources

* This Presentation:
  <br />jberkus.github.io/container_cluster
* Simplified Configuration Scripts:
  <br />github.com/jberkus/atomicdb/
* Crunchy Data Containers:
  <br />

---

## Spilo Resources

* Patroni Project:
  <br />github.com/zalando/patroni
* Spilo Project:
  <br />github.com/zalando/spilo
* Helm Chart:
  <br />github.com/kubernetes
  <br />/charts/incubator/patroni

---

![valentin from zalando](thanks_zalando.png)

### Thanks, Zalando!

---

# ¿questions?

.left-column-narrow[
more<br />jberkus:

project atomic:

&nbsp;
]

.right-column-wide[
@fuzzychef<br />
www.databasesoup.com<br />
jberkus.github.io

www.projectatomic.io

&nbsp;
]

.leftlogo[![rh logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
