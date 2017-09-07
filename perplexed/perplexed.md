
background-image: url(faces_shipping_containers.jpg)

##### Containers: A Guide for the Perplexed

.sigblock[
Josh Berkus

Red Hat

OSB 2017
]

.leftlogo[![rh logo](red_hat_dingbat.png)]

---

![what would maimonides do](WWMD.png)

---

![perplexed cover image](guide_perplexed.jpg)

---

>"Your purpose should be always to know the whole that was intended to be known."

---

>"A sensible man should not demand of me, or hope that when we mention a subject, we shall make a complete exposition of it."

---

![jessie frazelle](jessfraz.jpg)

---

![container spinning](container_corner.png)

### What's a container?

---

![docker logo](docker_logo.png)

---

![many container technologies](all_the_tech.png)

---

#### Everything You Know About Containers Is Wrong

---

.left-column[
![stack of kids in a coat](kids_coat.jpg)
]

.right-column[
## There Are No Containers
]

---

.left-column[
![stack of kids in a coat](kids_coat.jpg)
]

.right-column[
## &nbsp; Interlocking parts
<br />
<br />
<br />
* Linux Namespaces
* Cgroups
* Networking tricks
]

---

![lego death star](lego_death_star.jpg)

---

![lego escher](lego_escher.jpg)

---

![lego cthulu](chtulu.jpg)

---

background-image: url(container_reflection.jpg)

##### Containers<br />and Images

---

![not a pipe](not_a_pipe.jpg)

### What's an Image?

---

## Images

1. a tarball<br />
   containing a user FS
2. some metadata

image == packaging

---

## Layered Images

* union file system:<br />
  overlayFS, AuFS, devicemapper
* layers can be added
* layers can be shared

---

![image formats](image_formats.png)

### Image Formats

---

## Building Images

1. Copy a base image ("Fedora 26")
2. Add new layer(s)
3. Add metadata
4. Bundle up

---

## Building Tools

* Docker Build (Dockerfile)
* rkt
* Buildah
* ad-hoc

---

## Sharing Images: Registries

* hub.docker.io
* Google container registry
* CoreOS quay.io
* Specialty: CentOS, Fedora, etc.
* local registry

---

## Installing images

1. find on registies
2. download to a local cache
3. copy to memory at runtime

docker pull, skopeo

---

## How to Run an Image

*start a single binary from the image running on the host OS in a namespaced process, file, and resource space*

---

## Image Runtimes

* Docker Daemon<br />
  containerd
* Rkt + Systemd
* OCI + Systemd
* CRI-O

---

background-image: url(many_containers.jpg)

##### From One To Many

---

![cloud picture](container_cloud.jpg)

---

## Container Host OS

1. smaller<br />
  container support, nothing else
2. immutable<br />
  updates like containers

---

![container-oses](host_oses.png)

### Container Host OSes

---

#### "Orchestration"

*run many containers<br />over many machines*

---

## Parts of Orchestration

1. **Scheduler**: dispatches containers to machines
2. **Agents**: manages containers on each machine
3. **API Server**: communicates between machines
4. **DCS**: shared data store for cluster
5. **Plugins**: storage, networking, etc.

---

![orchestration systems](orch_systems.png)

### Orchestration Systems

---

## Networking

*out of the box, containers have only the host network, so we need to fake a network using Linux kernel tools so that they can pretend to be servers*

---

![networking tools](networks.png)

### Container Networking Tools

---

## Discovery

finding your containers

* name
* service type
* port

some DNS, some not

---

![discovery tools](discovery_services.png)

### Discovery Tools

---

## Storage

1. some containers need to store data
2. data can be ephemeral<br />(local Volumes)
3. data can also be long-term<br />(Persistent Volumes)
4. sometimes data needs to move with the container

---

## Ways to do storage

* network storage (NAS)
* local storage w/copying
* cloud storage (Gluster, Ceph, Rook, EBS)

no "container storage" ... yet

---

background-image: url(container_heap.jpg)

##### Other Stuff

---

## Hosting: CaaS and PaaS

* CaaS: someone lets you run containers on their infra (GKE, Amazon CS)
* PaaS: someone lets you run applications as containers on their infra (OpenShift, DEIS)

---

## More Containery Stuff

* monitoring
* tracing
* CI/CD tools
* API tools

---

![what would maimonides do](WWMD.png)

---

## Still Perplexed?

.left-column[
web:

IRC:

events:
]

.right-column[
www.databasesoup.com
www.projectatomic.io

\#atomic

www.ContainerDaysPDX.org<br />
August 3, Portland

Cloud Native Portland<br />
meetup.com/Cloud-Native-PDX/

]

.leftlogo[![rh logo](red_hat_dingbat.png)]

.rightlogo[![cc by sa](by-sa.png)]
