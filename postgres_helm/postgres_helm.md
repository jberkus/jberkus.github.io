background-image: url(elephant_jog.jpg)

#### Elephants on Automatic

.sigblock[
Josh Berkus, Red Hat

Oleksii Kliukin, Zalando

Kubecon EU 2017
]

.leftlogo[
![redhat logo](red_hat_dingbat.png)

![zalando logo](zalando_logo.jpg)
]

---

![state station](state_station.jpg)

### Getting to State

---

## Stateless Now

![nginx scaling](stateless_app.png)

---

## 1.5: StatefulSet

1. storage
2. identity
3. discovery

---

## Not Quite Enough

* "cluster join"
* failover
* special nodes
* rebalancing

---

## Custom Schedulers?

* not packaged with app
* kube expertise needed
* message lag

---

![running robot](robot_w_elephant_web_colour.jpg)

### Bot Pattern

---

## Bot Pattern

* control daemon in node
* runs as PID 1 in container
* communicates via consensus<br />or kube api

---

## Bot Tasks

* initialization
* joining cluster/group
* failover
* telemetry

---

## Bot Examples

* governor
* Patroni
* entrypoint.py
* Joyent's ContainerPilot

---

![elephant Vader helm](elephant-stormtrooper.png)

### Helm

---

## Helm Adds

* parameterization
* deploy multiple instances
* app registry
* support for sidecars

---

## Examples

1. Patroni/Spilo
2. CitusDB

---

## Patroni

* HA PostgreSQL controller
* Etcd, Zookeeper or Consul
* Spilo = Patroni + PostgreSQL

---

![spilo_diagram](spilo_diagram.svg)

---

## Extensibility

* callbacks
* custom replica creation methods
* pluggable consistent KV-stores

---

## More than autofailover

* synchronous mode
* cascading replication
* dynamic configuration

---

## Cluster maintenance

* "Hands-off" mode
* Scheduled failovers and restarts

---

## Interfaces

* REST API
* patronictl

---

## Helm parameters

 * cluster name
 * Etcd host
 * number of replicas
 * credentials

---

#### Patroni Demo

![patroni demo](elephant_patroni_live_demo.png)

---

![citus sharded](citus_sharded.png)

### CitusDB

---

## Sharded Parallel Postgres

* sharded Postgres
* partition data over nodes
* shards duplicate for redundancy
* query node distributes queries
* mainly for data mining (big data)

---

## StatefulSet Setup

* one query node (node 0)
* 2 to N shards
* service for query node only

---

## Simple Bot

* if node 0, query node
* if not node 1, register with query node
* updates Kubernetes label for discovery
* (auto rebalancing not OSS, yet)

---

## Helm Params

* cluster name
* cluster size
* storage allocation
* passwords

---

#### Citus Demo

---

#### Pull Requests Welcome!

github.com/zalando/patroni

github.com/jberkus/atomicdb

---

## Resources

* This Presentation:
  <br />jberkus.github.io/container_cluster
* Simplified Configuration Scripts:
  <br />github.com/jberkus/atomicdb/

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

## Spilo demo:

 * Helm Chart:
 <br />github.com/alexeyklyukin/
 <br />/charts/incubator/patroni

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
