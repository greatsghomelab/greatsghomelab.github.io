---
layout: post
title: How to detect suspicious devices in your home network
- Cyber-Security
- OSINT
tags:
- Cyber-Security
- Unifi
- VLANs
- Firewall
- OSINT
- Open Source Intelligence

---

## Introduction

Here in Singapore, we often take our home Wi-Fi network for granted. Typically, we just have a technician from our Internet Service Providers (ISPs) set up the router, the Optical Network Terminal (ONT), and related equipment in the DB box, and that's the end of it. This usually leaves all our devices—Laptops, PCs, Tablets, and Internet of Things (IoT) devices—on a single, flat network (or perhaps some basic VLANs) without proper segmentation. This setup is perfectly adequate if your only goal is connecting to the internet.

However, for power users, this lack of segmentation is a major issue—especially when operating a homelab. I've already walked you through my own home network setup and segmentation strategy in [this article and video](https://greatsghomelab.github.io/posts/setting-up-secure-home-network-in-singapore/). Today, I want to dive deeper into the observability of that network. Specifically, we'll be looking at:

- The overall internal home network activity.
- Which devices are connected to which network segment.
- How to detect suspicious devices and use their MAC addresses for quick identification.

## First look at the client devices that connected in your network

![UCG connected devices](../assets/img/detectthreats/Screenshot%202025-10-06%20at%204.50.47 PM.png)

The screenshot above shows the Unifi Cloud Gateway Fiber (UCG)'s web dashboard that shows all the connected devices connected to the different networks that I have created previously. UCG does its best to identify by hardware vendor for easier identification and is almost complete.

## Identifying the connected devices

While the UCG provided information is great, there is a lot more we can do with this information to hunt down suspicious devices within our network.

To get started, let's have a bit of a refresher.

![tcpiposi](../assets/img/detectthreats/osianimated.gif)

Since we're dealing with physical devices, we need to understand that each one is assigned a unique MAC address (Media Access Control) right when it's manufactured. Think of the MAC address as the device's permanent, physical street address.

The network then uses this MAC address to assign an IP address. This is what lets the device move up to Layer 3, the Network Layer, where the actual routing across the internet or between different subnets takes place. Essentially, the MAC address gets it in the door, and the IP address tells the router where to send the data next.

To get this mac address, simply click on one of the devices and you will see the mac address of the device as follow.

![macddr](../assets/img/detectthreats/Screenshot%202025-10-06%20at%204.53.04 PM.png)

Ok, you've got the mac address, you kind of some information from UCG fiber on what type of device this is, now what?

This is where the online lookup tools like https://dnschecker.org/mac-lookup.php come in for reconning the device. You can simply paste in the mac address and find out more details about them.

![dnschecker](../assets/img/detectthreats/Screenshot%202025-10-07%20at%201.51.24 PM.png)

In this case, I had no idea LCFC(HeFei) Electronics Technology co.ltd is "Lenovo's largest global R&D and manufacturing base for personal computers". A simple google searching of the name gave a lot more details of the manufacturer

## Conclusion

That is all I wanted to cover with this article. Hopefully you learnt something. Please do share your experiences in the comment section of the video, Like if this helped you learn something and subscribe for more content in the future.
