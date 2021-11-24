# Port-forward the postgres service created using the helm chart
kubectl port-forward --namespace default svc/katacoda-postgresql 5432:5432