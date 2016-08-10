#### Bots Not Cattle

![robo rally bots](bots_board.jpg)

.sigblock[
Josh Berkus

Red Hat OSAS

OSBridge 2016
]

.leftlogo[![pgx logo](red_hat_dingbat.png)]

---

#### DevOps

---

![postgresql logo](elephant400.png)

---

## third wave of automation

1. packages
2. configuration management
3. ???


---

## third wave of automation

1. packages
2. configuration management
3. container orchestration?


---

## third wave of automation

1. packages
2. a. configuration management<br />
 &nbsp;b. container orchestration


---

## third wave of automation

1. packages
2. a. configuration management<br />
 &nbsp;b. container orchestration
3. ???

---

![cattle not pets](cattlenotpets.jpg)

---

## pets

* require special pampering
* have names
* get taken to the vet when sick

---

## cattle

* get herded in large groups
* have numbers
* get butchered if sick

---

## the DevOps metaphor

* 10 servers: pets
* 10,000 servers: cattle

---

## the problem with cattle

* *dumb*
* herd them in (sort of) one direction
* centrally managed

---

![cattle stampede](stampede.jpg)

---

## central management limits

* infrastructure scale
* people scale
* dev/ops split
* application sophistication

---

## Roborally

![roborally cover](roborally_cover.jpg)

---

![roborally instructions](bot_moves.jpg)

---

![roborally board](bots_board.jpg)

---

![roborally big board](giant_robo.jpg)

---

![roborally collision](roborally-collision.jpg)

---

![handyrep logo](handyrep.png)

---

![dr. strangelove telephone](game_telephone.png)

---

![ifttt logo](ifttt.png)

---

## intelligent bots

* capable of reacting to deployment, configuration, and availablity events
* programmed to "do the right thing" in each case

---

## state machine

![state machine basic image](state_machine.gif)

---

## state machine

![on-off state machine](on-off-machine.png)

---

## advantages of state machines

* simpler, testable logic
* avoid unhandled events
* no scheduler required

---

## new bot rules

1. bots initialize themselves
2. bots know their own state
3. bots share their state
4. bots change their state in response to events

---

## new bot rules

1. self-configuration
2. persistent state store
3. distributed configuration
4. event-driven response loop

---

## new bot rules

1. sophisticated init code
2. store state in memory
3. write state to etcd
4. watch etcd for changes

---

## patroni

![patroni image](patron_saint.jpg)

---

![initial state](state_1.png)

---

![state 2](state_2.png)

---

![state 3](state_3.png)

---

![state 4](state_4.png)

---

![state 5](state_6.png)

---

## Postgres State Machines

* Patroni / Compose.io
* Manatee / Flynn.io

---

## Other Projects

* mgmt
* Habitat
* Nomad

---

![robot exercising](botercizing.jpg)

### boticizing

---

## boticizing your app

1. How can it initialize and self-configure?
2. How can it store state about its part of the infrastructure?
3. Use a DCS.
4. Rewrite management as a set of state transitions.

---

## example: web application

Initialization:
1. initialize with etcd connection information and node name
2. query DCS for DB connection & CDN
3. pull new content from git
4. launch
5. update DCS with state

---

## example: web application

Content Response Loop:
1. has there been a git push?
2. if yes, pull new content
3. refresh
4. update DCS with state

---

## example: web application

Load Response Loop:
1. idle node polls for load messages
2. if found: spin up a web server
3. update DCS

---

![sorceror's apprentice](problems.jpg)

### problems with bots

---

## bot problems

* lagginess: better event watch
* race conditions: programming, DCS locking
* resource usage: resource events

---

## bot problems

* harder for devs: ¯\_(ツ)_/¯

we're all DevOps now

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
