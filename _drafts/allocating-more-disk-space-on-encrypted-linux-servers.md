---
layout: post
title: Allocating more disk space on encrypted linux servers
categories:
- Home-lab
- Systems
tags:
- Cryptography
- Encryption
- Security-Engineering
---

## Introduction

There are 2 steps when allocating more space.

1. Physical partition space allocation
2. Disk volume reclamation

## Physical partition space allocation

Check if the physical partition where your Linux OS is on has all the space allocated to it.

![lsblkoutput]()

![parted output]()
