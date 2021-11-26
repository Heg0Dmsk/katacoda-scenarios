In the following we will delplyo PostgreSQl to Kubernetes using a persistent volumen claim as the storage provider.

## Persistent volume

In a first step we will create a persistent volume which uses the storage of the Kubernetes host. This resource is needed to provide persistent storage for the persistent volume claim that we will create later

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

After copying the resource definition to the editor, we need to apply the file to create the Kubernetes resource.

`kubectl apply -f persistent-volume.yml`{{execute}}

## Persistent volume claim

After creating the persistent volume, we need to request access to volume for our application. This is done in Kubernetes by creating a persistent volume claim.

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

Like before, we need to copy the Kubernetes resource to the editor and apply it using the command line.

`kubectl apply -f persistent-volume-claim.yml`{{execute}}

## Check if the persistent volume claim is connected to the persistent volume

`kubectl get pvc`{{execute}}

## Deploying PostgreSQL using helm

To simplify the installation process, we will use a predefined helm charts to create the remaining Kubernetes resources (e.g. stateful set, service) for this exercise.

1. We add the required helm chart
  `helm repo add bitnami https://charts.bitnami.com/bitnami`{{execute}}
2. We install postgres using the previous created, specified persistence volume claim
  `helm install katacoda bitnami/postgresql --set persistence.existingClaim=postgres-persistent-volume-claim --set volumePermissions.enabled=true`{{execute}}
3. Getting the PostgreSQL password
   `export POSTGRES_PASSWORD=$(kubectl get secret --namespace default katacoda-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)`{{execute}}
