# Introduction

This Kubernetes folder contains the necessary files to deploy YottaDB-Demo in Kubernetes.
For demonstation purposes, Kubernetes is deployed in a single node cluster using Minikube, Vagrant and Oracle VM.

# Deployment

    git clone https://github.com/RamSailopal/YottaDB-Demo.git
    cd YottaDB-Demo/Kubernetes
    
    vagrant up
    
Wait for the following message to appear:

    Kubernetes deployment is now running!!!
    
# Architecture

![Alt text](YottaDB-Demo-Kube.png?raw=true "Kubernetes Architecture")

Persistent volumes are created for the YottaDB database and the API code. In this Vagrant implementation, these persistent volumes are served simply as a host drive but for redundancy in a production environment, the volumes should be node independant i.e a cloud service provider NFS.

Externally exposed services are created for the API (port 8001), the IDE (port 3002), the global viewer (8001) and Metabase (3000). These can be accessed i.e http://localhost:3000. Internal cluster exposure is made to the ssh port 22 for IDE access to YottaDB via the terminal

The existing set up means there is a single point of failure with the Metabase deployment given that there is only one pod in the deployment. This can be avoided by utilising SQL as a Metabase storage option and utilsing a fault tollerant DatabaseAsAService approach from a cloud service provider.

