# persisting-data-inside-k8s.md

Kubernetes offers a lot of different volumes. The documentation list over 20 different kinds of volumes which can be used for storing data with Kubernetes [6]. Among others, these include:

- awsElasticBlockStore
- cephfs
- configMap
- emptyDir

All of those volumes can be categories into two different categories:

- persistent volumes
- regular volumes

While regular Kubernetes volumes are bound to the lifecycle of the lifecycle of a Pod (smallest Kubernetes unit, containing one or multiple containers). Persistent volumes are bound to the lifecycle of the whole cluster. Therefore they allow storing persistent data and sharing it between multiple containers [7, pp. 148-148 and 152].

In order to get access to a persistent volume and bind storage to a Pod, persistent volume claims need to be used [7, pp. 153-154].
