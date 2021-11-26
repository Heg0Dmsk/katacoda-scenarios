One option of storing data with Docker are Docker volumes. They are tightly integrated into Docker and can be accessed using their own API (Docker Deep Dive, 184). In the following we will see how to create, inspect volumes and mount them inside a Docker container. (Docker Deep Dive 184)

## Creating docker volumes

By executing the following command we are able to create a Docker volume and name it katacoda.

`docker volume create katacoda`{{execute}}

## Inspecting Docker volumes

The following command allows us to list all available Docker volumes.

`docker volume ls`{{execute}}

Additonally we can inspect a specific volume using the following command:

`docker volume inspect katacoda`{{execute}}

# Mounting Docker volumes inside a container

To use the previously created docker volume, we must specify it as a parameter when creating a new container. The folowing command creates a postgres container that uses the volume as the database storage by mounting the volume into the data directory of the postgres container.

`docker run -d --name existing-volume -v katacoda:/var/lib/postgresql/data postgres:14.1-alpine`{{execute}}

Strictly speaking we don't need to create the docker volume beforehand, as an alternative we can let docker create the volume by exuting the same command as before but with a different unused volume name

`docker run -d --name existing-volume -v unused-volume-name:/var/lib/postgresql/data postgres:14.1-alpine`{{execute}}

To verify this we can get a list of all docker volumes by executing the following command:

`docker volume ls`{{execute}}