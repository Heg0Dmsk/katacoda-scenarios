Like other container technologies, docker offers multiple options to store data. These include:

1. Docker volumes
2. Docker bind mounts
3. tmpfs mounts

While tmpfs has its use cases as a fast data store in RAM, it only can be used for temporary data. In the following slides we will take a look at the remaining storage options, docker volumes and docker bind mounts, that allow storing persistent data. Technically it is also possible to persist data inside the docker image by copying the data into it during its creation. However this method has few use cases because it is very limited. It follows that docker volumes and docker bind mounts are the two only general, meaningful option for storing data persistently with Docker. That's why we take a look at those two option in the following slides. (Kubernetes and Docker enterprise guide, pp. 27)