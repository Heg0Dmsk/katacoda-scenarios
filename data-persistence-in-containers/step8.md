# K8S - Persistent Volume Claim

## (heading to be deleted)> Data is the new gold

<pre class="file" data-filename="persistent-volume.yml" data-target="replace">
---
kind: PersistentVolume
apiVersion: v1
metadata:
  name: postgres-persistent-volume
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 100M
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
</pre>

`kubectl apply -f persistent-volume.yml`{{execute}}

<pre class="file" data-filename="persistent-volume-claim.yml" data-target="replace">

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  labels:
    app: postgres
  name: postgres-persistent-volume-claim
spec:
  storageClassName: manual
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 100M
</pre>

```kubectl apply -f persistent-volume-claim.yml```{{execute}}

### Check if the persistent volume claim is connected to the persistent volume

```kubectl get pvc```{{execute}}

## Deploying PostgreSQL using helm

To simplyfy the installation of postgres, we will use a helm chart for all other kubernetes resources needed for the delployment of PostgreSQL

1. We add the required helm chart
   `helm repo add bitnami https://charts.bitnami.com/bitnami`{{execute}}
2. We install postgres using the previous created, specified persistence volume claim
   
  ` helm install katacoda bitnami/postgresql --set persistence.existingClaim=postgres-persistent-volume-claim --set volumePermissions.enabled=true`{{execute}}