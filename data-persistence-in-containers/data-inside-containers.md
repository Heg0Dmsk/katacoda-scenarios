Container virtualization is a mordern technology that allows to host, configure and sclae multiple application on a single host. It is an alternative to traditional virtualization by a hypervisor. Containers are deployed using container images, which act as blueprint for the application.

 By design, containers should be immutable. That means they should be read-only. Instead of changing the configuration of a container inside the container, the container should be replaced by a new one with a changed configuration.
(Docker Deep Dive, 183)

&nbsp;

![Ephemeral container storage](./assets/ephemeral-container-storage.png)
Figure 2: Ephemeral container storage

Source: (Docker Deep Dive, 183)

&nbsp;

As shown in figure 2, additionally to the read-only image layers, container technology like Docker often a single writable layer. Most of the times it ist tightly coupled to the lifecycle of the container and gets deleted together with the container. Persistent data has the property of not being tied to the lifecycle of a container. Furthermore, this allows for data to be shared between multiple containers (Docker Deep Dive, 183-184)
