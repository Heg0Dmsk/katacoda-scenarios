# Persisting data inside Docker containers

## (heading to be deleted)> Data is the new gold
Like other 
While tmpfs has its use cases as a fast data store in RAM, it only can be used for temporary data. In the following sildes we will take a look at the remaining storage options, docker volumes and docker bind mounts, that allow storing persistent data. Technically it is also possible to persist data inside the docker image by copying the data into it during its creation. However this method has few use cases because it is very limited


, as it only allows storing data before deploying the application and it does not dynamically storing data.