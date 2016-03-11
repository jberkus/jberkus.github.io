
.left-column[

![Full Auto Cars](battle_cars_panel.png)

]

.right-column[

##### Full<br />Auto<br />Database

]

.sigblock[
Josh Berkus

Red Hat Project Atomic

KubeCon.EU 2016
]

.leftlogo[![redhat logo](red_hat_dingbat.png)]

---

![auto battle game shot](battle_cars_2.png)

---

![google car](google_car.png)

---

## WIP: waiting for 1.2/1.3

![under constuction](construction-site.jpg)

---

![yak shaving](yak-shaving.jpg)


---

#### Demo

---

## Single Master DBs: Problem

* low availability
* unidirectional replication
* very manual HA solutions

---

## Why not multi-master DBs?

just moving the problem around

* "eventual" consistency
* network lag
* maturity issues
* feature poverty
* app compatibility

---

## But PG Replicaton is Awesome!

* Easy to set up
* Guaranteed
* Corruption-free
* Anti-footgun
* Combines with DR

---

![y u no guy](y_you_no_failover.png)

### Y U No Failover?

---

#### "Automated failover is too complicated.  You don't want it."

---

#### NO!

---

## Hard != Impossible

![google car](google_car.png)

---

## Hard != Impossible

_general_ autofailover is prohibitive

but ... we can implement common use cases

---

## The 80% Solution

1. Pool of async replicas
2. Cheap/replacable nodes
   <br />Containers
3. Watchdog service
4. Auto-promote one replica
5. Other nodes remaster
6. Update routing

---

## Now, a little history ...

![handyrep logo](handyrep.png)

---

## Handyrep

* master-controller architecture
* based on Python Fabric + SSH
* worked in production
* worked with any Postgres config
* pluggable

www.handyrep.org

---

## Handyrep: _too general_

* Difficult to install
* Difficult to debug
* Over 100 configuration options
* Scaled poorly
* HR server was SPoF

---

## Zalando

* no1 European online fashion
* 15m customers
* 150 databases
* 24/7/365 operation

... needed automated, decentralized HA

---

## Failover Failure

.left-column[

![crushed elephant](fail.png)

]

.right-column[

* False failover
* Misfires
* Race conditions

]

---

![split brain](split_brain.jpg)

---

## Split Brain and S-M DBs

* worst possible outcome
* automated recovery impossible
* manual recovery painful

---

![St. Francis feeding the flying elephants](patron_saint_slony.png)

### Patroni

---

![compose.io announcement](compose_governor.png)

---

1. Postgres is a poor store of its own replication state
2. Smart agents > top-down controllers

---

## Compose Governor

* Containers
* Etcd-based consensus
* Simple PostgreSQL controller

... so we forked it.

---

# How it works

---

![failover in three parts](three_parts.png)

### failover est omnis divisa in partes tres

---

![failover in three parts 2](3_parts_2.png)

### failover est omnis divisa in partes tres

---

## The Patroni Controller

![patroni controller](elephant_rider.jpg)

---

## Patroni controller

* Python daemon
* Runs in each container as PID 1
* Controls Postgres startup/shutdown/config
* Provides external REST API
* Enforces opinionated config

---

## Patroni Failover

![how patroni works animation](failover_1.png)
 leader

---

## Patroni Failover

![how patroni works animation](failover_2.png)

---

## Patroni Failover

![how patroni works animation](failover_3.png)

---

## Patroni Failover

![how patroni works animation](failover_4.png)

---

## Patroni Failover

![how patroni works animation](failover_5.png)

---

## Patroni Failover

![how patroni works animation](failover_6.png)

---

## Patroni Failover

![how patroni works animation](failover_7.png)

---

## Patroni Failover

![how patroni works animation](failover_8.png)

---

## Patroni Failover

![how patroni works animation](failover_9.png)

---

## Patroni Failover

![how patroni works animation](failover_10.png)

---

## Patroni Failover

![how patroni works animation](failover_11.png)

---

## Patroni Failover

![how patroni works animation](failover_12.png)

---

## Patroni Failover

![how patroni works animation](failover_13.png)

---

## Patroni Failover

![how patroni works animation](failover_14.png)

---

## Patroni Failover

![how patroni works animation](failover_15.png)

---

### What about split-brain?

![split brain](split_brain.jpg)

---

## Etcd

* distributed consensus HTTP data store
* Raft algoritm
* implements CA
* great for config + metadata
    * not for data data

---

## Etcd Alternatives

* Zookeeper
    * larger scale
    * supported
* Consul
    * integrates discovery
    * not (yet) suppported

---

## What's AtomicDB?

_WIP project_

* PostgreSQL
* Patroni
* Atomic Host
* Kubernetes
* Dynamic proxy (dev)
* Cockpit UI (dev)

---

#### Let's see that again

---

## The Proxy Problem

* differentiate master and read-only connections
* master service needs to follow failover
* failover logic too complex for kubernetes (1.1)

---

## pgbouncer?

* current implementation in pgbouncer
* master, read slaves separate services/ports
* depends on flannel LB

_not good enough.  Waiting for 1.2/1.3!_

---

## More features

* pg_rewind support (9.4+)
* configurable node imaging
    * WAL-E
    * PITR
* synchronous replication
* non-failover replicas

---

## More Stuff Under development

* cascading replication
* integrated proxy
* BDR support?

_fork us on Github!_

---

## Resources

* This Presentation:
  <br />jberkus.github.io/full_auto_db
* Patroni Project:
  <br />github.com/zalando/patroni
* AtomicDB Project:
  <br />github.com/jberkus/atomicdb

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

www.projectatomic.io
_RedHat booth for Cockpit Kube demo_
&nbsp;
]



.leftlogo[![rh logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
