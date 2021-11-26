As alternative to volumes, Docker offers the option to used bind mounts. Contrary to Docker volumes they are not managed by Docker and that's whys the cannot be controlled by Docker. They can be located anywhere on the host's file system (k8s + docker enterprise guide, 36)

`mkdir mounted-directory`{{execute}}

# Using a bind mount as storage for a container

Instead of using a docker volume, we create a postgres container this time by mounting the data storage with a bind mount to a specific path on our host file system.

`docker run -d --name bind-mount -v /root/mounted-directory:/var/lib/postgresql/data -e POSTGRES_DB=db -e POSTGRES_PASSWORD=password postgres:14.1-alpine`{{execute}}

Afterwards we can get shell access with this command:

`docker exec -it bind-mount bash`{{execute}}

# Verifying that the bind mount works as intended

To verify that the bind mount functions as expected we naviagate to the mounted directory and list all it's item using the next two commands.

`cd ../var/lib/postgresql/data`{{execute}}

To be able to verify later that the bind mount is two-directonal, we now create a test file inside the mounted dircetory. Furthermore the following three commands inlude a check for the successful creation of the test file and us exiting the container.

`touch created-inside-the-container.txt`{{execute}}

`ls`{{execute}}

`exit`{{execute}}

# Verify that the file created inside the container can be accessed on the host

To verify that the mount works as intended, we list all files and directories in our host root directory with the following command.

`ls`{{execute}}