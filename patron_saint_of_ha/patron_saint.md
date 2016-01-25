
.left-column[

![St. Francis feeding the flying elephants](patron_saint_slony.png)

]

.right-column[

##### Patroni: Your Patron Saint of PostgreSQL HA

]

.sigblock[
Josh Berkus

Red Hat OSAS

SCALE 2016
]

.leftlogo[![redhat logo](red_hat_dingbat.png)]

---

#### Demo

---

## PG Replicaton is Awesome!

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

_general_ autofailover is prohibitive

but ... we can implement common use cases

---

## The 80% Solution

1. Pool of async replicas
2. Cheap/replacable nodes
   <br />VMs/Containers
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

![St. Francis feeding the flying elephants](patron_saint_slony.png)

---

![compose.io announcement](compose_governor.png)

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

## How it works

![how patroni works animation](failover_1.png)
 leader

---

## How it works

![how patroni works animation](failover_2.png)

---

## How it works

![how patroni works animation](failover_3.png)

---

## How it works

![how patroni works animation](failover_4.png)

---

## How it works

![how patroni works animation](failover_5.png)

---

## How it works

![how patroni works animation](failover_6.png)

---

## How it works

![how patroni works animation](failover_7.png)

---

## How it works

![how patroni works animation](failover_8.png)

---

## How it works

![how patroni works animation](failover_9.png)

---

## How it works

![how patroni works animation](failover_10.png)

---

## How it works

![how patroni works animation](failover_11.png)

---

## How it works

![how patroni works animation](failover_12.png)

---

## How it works

![how patroni works animation](failover_13.png)

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
    * not yet suppported

---

### Distributed consensus

![consensus](distrib_consensus_1.png)

---

### Net-split prevention

![net split](distrib_consensus_2.png)

---

#### Let's see that again

---

## What's included

* Patroni agent
* RESTful API
* patroni-cli

---

## What's not included

* Proxy/routing
* GUI
* Orchestration
* Monitoring

---

## Downstream projects

* Spilo
    * From Zalando
    * AWS tools + Patroni
    * https://github.com/zalando/spilo

---

## Downstream projects

* AtomicDB
    * Patroni + Kubernetes + Atomic
    * OpenShift-compatable
    * not public yet

---

## More features

* pg_rewind support (9.4+)
* configurable node imaging
    * WAL-E
    * PITR
* synchronous replication
* non-failover replicas

---

## Under development

* cascading replication
* integrated proxy
* BDR support?

_fork us on Github!_

---

## Resources

* This Presentation:
  <br />jberkus.github.io/patron_saint_of_ha
* Patroni Project:
  <br />github.com/zalando/patroni
* Spilo Project:
  <br />github.com/zalando/spilo
* Compose governor:
  <br />github.com/compose/governor

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









