# Manually setting up a K8S cluster, because the VS Code integration for katacoda can only be used 
# with ubuntu images (https://www.katacoda.community/essentials/layouts.html#vs-code-layout)
# making it impossible to use a kubernetes environment


# Installing kubectl to get access to the K8S cluster
snap install kubectl --classic

# Getting the K3D (K3S (Kubernetes Distribution) in Docker) command line
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Creating the K8S single node cluster
k3d cluster create katacoda

# Getting the cluster’s kubeconfig (included in k3d cluster create)
k3d kubeconfig merge katacoda --kubeconfig-switch-context

snap install helm --classic