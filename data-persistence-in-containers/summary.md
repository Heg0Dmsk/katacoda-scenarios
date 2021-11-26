# Summary

- Data inside Containers is ephemeral => gets lost during container restart or shutdown
- Therefore it is needed to persist the data
- Each container technology offers different options to persist data
- Docker
  - bind mounts
  - named volumes
- Kubernetes
  - over 20 different types of volumes
  - e.g. persistentVolumeClaim
