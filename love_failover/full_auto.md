background-image: url(title_slide.png)

.sigblock[
Josh Berkus

Red Hat Project Atomic

pgCon 2016
]

.rightlogo[
![redhat logo](red_hat_dingbat.png)
]

---
background-image: url(dr_strangelove2.jpg)
background-position: center;
background-repeat: no-repeat;
background-size: contain;

#### Fully Automated High Availability

---

![combat UAV picture](reaper-drone_large.jpg)

---

![google car](google_car.png)

---

![yak shaving](yak-shaving.jpg)

---

![demo cluster](tiny_cluster.png)

### Demo

---

## Single Master Postgres: Problem

* low availability
* unidirectional replication
* very manual HA solutions

---

## Why not multi-master?

Well, you want to talk hard problems ...

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

background-image: url(too_complicated.gif)

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

![large group of people](all_people.jpg)

---

## Handyrep: _too general_

* Difficult to install
* Difficult to debug
* Over 100 configuration options
* Scaled poorly
* HR server was SPoF

---

![game of telephone](game_telephone.png)

---

## The Problem with Master-Controllers

* Failover Code: 100 lines, 1 issue
* Detecting Desynchronization: 400 lines, 10+ issues

_Need to make sure that if the controller shuts down, so does PostgreSQL_

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

![split brain](splitbrain.jpg)

---

## Split Brain and 1-M DBs

* worst possible outcome
* automated recovery impossible
* manual recovery painful

---

## Patroni

![St. Francis feeding the flying elephants](patron_saint_slony.png)

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

![failover in three parts](3_parts_1.png)

---

![failover in three parts 2](3_parts_2.png)

---

![failover in three parts 2](3_parts_3.png)

---

## The Patroni Controller

![patroni controller](yippee-kay-ai.jpg)

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

![split brain](splitbrain.jpg)

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
* Consul
    * geo-dist, gossip
    * not (yet) suppported
* pg_paxos?

---

## Stacks: Spilo

_Production Stack_

* From Zalando
* Patroni
* AWS Tools
* AWS Automation

---

## Stacks: AtomicDB

_AtomicDB demo project_

* PostgreSQL
* Patroni
* Atomic Host
* Kubernetes
* Dynamic proxy (dev)
* Cockpit UI (dev)

---

![tiny cluster](tiny_cluster.png)

### Let's see that again

---

## Alternatives

![flying dude](flying.png)

---

## Flynn.io

* Descendant of Manatee, Yoke
* Production code
* No-data-loss solution
* Depends on ZFS
* https://github.com/flynn/flynn

---

![flynn failover](flynn1.png)

---

![flynn failover](flynn2.png)

---

![flynn failover](flynn3.png)

---

![flynn failover](flynn4.png)

---

## Flynn vs. Patroni

* Flynn: Max Data Protection (CP), Go
* Patroni: Max Availability (PA), Python

Use Flynn to guarantee keeping your data, use Patroni to guarantee that a DB is available and can scale.

---

## Other Alternatives?

* Stolon: Patroni in Go
* Original Compose.io
* Manatee
* Nanopack/Yoke

---

## The Proxy Problem

* differentiate master and read-only connections
* master service needs to follow failover
* can't manage persistent endpoints in Kubernetes 1.2

---

## pgbouncer?

* current implementation in pgbouncer
* master, read slaves separate services/ports
* depends on flannel LB
* problems: no live failover (can't terminate active connections)

---

## proxy possibilities

* augment pgbouncer
* Flynn discoverd code, or Solon proxy
* new Go-based proxy
* Kubernetes 1.3 PetSet

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
* Consul support
* BDR support?

_fork us on Github!_

---

## Resources

* This Presentation:
  <br />jberkus.github.io/love_failover
* Patroni Project:
  <br />github.com/zalando/patroni
* AtomicDB Demo:
  <br />github.com/jberkus/atomicdb

---

## ¿questions?

.left-column-narrow[
more<br />jberkus:

project atomic:

&nbsp;
]

.right-column-wide[
@fuzzychef<br />
www.databasesoup.com<br />

www.projectatomic.io
_See micro-cluster at RH Summit, Dockercon_
&nbsp;
]

.leftlogo[![rh logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]

---

#### Come to pgConf Silicon Valley!<br />www.pgconfsv.com<br />November 14-16
