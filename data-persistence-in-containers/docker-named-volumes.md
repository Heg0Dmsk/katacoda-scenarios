One option of storing data with Docker are Docker volumes. They are tightly integrated into Docker and can be accessed using their own API [4, pp. 184]. In the following we will see how to create, inspect volumes and mount them inside a Docker container.

## Creating docker volumes

By executing the following command, we are able to create a Docker volume and name it katacoda.

`docker volume create katacoda`{{execute}}

## Inspecting Docker volumes

The next command allows us to list all available Docker volumes.

`docker volume ls`{{execute}}

Additionally, we can inspect a specific volume using the following command:

`docker volume inspect katacoda`{{execute}}

## Mounting Docker volumes inside a container

To use the previously created docker volume, we must specify it as a parameter when creating a new container. The next command creates a postgres container that uses the volume as the database storage by mounting the volume into the data directory of the postgres container.

`docker run -d --name existing-volume -v katacoda:/var/lib/postgresql/data -e POSTGRES_DB=db -e POSTGRES_PASSWORD=password postgres:14.1-alpine`{{execute}}

Afterwards we can get shell access with this command:

`docker exec -it existing-volume bash`{{execute}}

Now we will create some test data in the default directory, to show that it is not persistent due to the volume only being mounted to `var/lib/postgresql/data`. Only data inside this folder and subfolders will be persisted.

`touch ephemeral.txt`{{execute}}

`ls`{{execute}}

To be able to verify the persistent storage later, we now create a test file inside a directory of the container which is persisted by mounting the docker volume. In a first step, we navigate into the correct volume using the following command.

`cd ../var/lib/postgresql/data`{{execute}}

Then we create the test file, check if it has been successfully created and exit the container.

`touch persistent.txt`{{execute}}

`ls`{{execute}}

`exit`{{execute}}

Strictly speaking, we don't need to create the docker volume beforehand, as an alternative, we can let docker create the volume by executing the same command as before but with a different unused volume name.

`docker run -d --name unused-volume -v unused-volume-name:/var/lib/postgresql/data postgres:14.1-alpine`{{execute}}

To verify this, we can get a list of all docker volumes by executing the next command:

`docker volume ls`{{execute}}

## Verify that the data is persistent

To verify that we successfully have persisted the test data from the previous step, we first will stop and remove the container

`docker rm $(docker stop $(docker ps -a -q --filter="name=existing-volume"))`{{execute}}

... and start it again 

`docker run -d --name existing-volume -v katacoda:/var/lib/postgresql/data -e POSTGRES_DB=db -e POSTGRES_PASSWORD=password postgres:14.1-alpine`{{execute}}

Now we are able to verify that data in the default directory is non-persistent due to the used mount path by executing the following commands:

`docker exec -it existing-volume bash`{{execute}}

`ls`{{execute}}

After we have verified this, we can check if the other test file has been successfully persisted by using the next two commands:

`cd ../var/lib/postgresql/data`{{execute}}

`ls`{{execute}}

After the successful verification we can exit the container and move on to the next slide to take a look at Docker bind mounts.

`exit`{{execute}}
