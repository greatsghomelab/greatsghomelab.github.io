---
layout: post
title: Allocating more disk space on running linux servers
categories:
- Home-lab
- Systems
tags:
- Security-Engineering
---

## Introduction

There are 2 steps when allocating more space on running production linux machines.

- [Introduction](#introduction)
- [Physical partition space allocation](#physical-partition-space-allocation)
- [File system reclamation](#file-system-reclamation)
   
## Physical partition space allocation

Check if the physical partition where your Linux OS is on has all the space allocated to it. In the photo below, the physical disk has only 32GB allocated and the root partition is actually using all physical disk space.

![lsblkoutput](/assets/img/diskresize/lsblk.png)

Running the `df -h` command lets us see that the logical filesystem usage of more than 82% already on the machie.

In this case, we will have to allocate more disk space from the hypervisor to the virtual machine. 

![hypervisordisk](/assets/img/diskresize/diskaction.png)

Let's say I want to increase the disk size to 42G. I will have to input size increment of 10G from original size to get to 42G disk space.

![allocatespace](/assets/img/diskresize/allocation.png)

We will need to use parted command to allocate the disk space given from the hypervisor using `parted` command. The below is the screenshot of the process

![parted](/assets/img/diskresize/parted.png)

We first use parted on the main physical disk `/dev/sda`.
Then we `resizepart 3` as the root filesystem is on `sda3`.
We allocate all the diskspace by inputting -0

This concludes the physical partition space allocation process. Now, let's get into the Disk volume reclamation for the actual file system.

## File system reclamation

We can see from lsblk output that although the physical disk is fully allocated, the linux logical filesystem is still not reclaimed.

![allocatedbutnotreclaimed](/assets/img/diskresize/notreclaimed.png)

To grow the linux filesystem, we'l need to use `resize2fs` or `xfs_growfs`. Since the root file system is on partition 3, we use the below command

```
sudo resize2fs /dev/sda3
```

The screenshot below is the before and after filesystem reclaimation.

![afterreclaim](/assets/img/diskresize/afterreclaim.png)

I hope you found this guide useful.Please share your own experiences or tips in the comments section below. If you learned something today, give this video a "Like," and don't forget to subscribe for more content in the future.
