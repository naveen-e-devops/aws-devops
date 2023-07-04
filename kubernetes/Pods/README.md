In Kubernetes, a Pod is the smallest and simplest unit of deployment. It is a logical host for a single container or multiple tightly coupled containers that share the same resources, such as storage and network. A Pod represents a single instance of a running process in a cluster.

Pod life cycle
A Pod has a lifecycle that goes through several phases, from pending, running, succeeded, failed, to unknown. These phases indicate the current state of the Pod and what is happening to it at any given moment.

Here is a brief explanation of each phase in a Pod's lifecycle:

Pending: this is the initial phase when the Pod is created and the Kubernetes scheduler is looking for available nodes to run the Pod. During this phase, Kubernetes allocates resources for the Pod, such as CPU and memory, and it pulls the required container images.

Running: this phase indicates that the Pod has been scheduled to a node and has started running its containers. At this stage, the container(s) within the Pod are considered "live" and running their intended functionality.

Succeeded: this phase indicates that all the containers in the Pod have exited successfully and no further action is required from the Pod. In other words, the purpose of the Pod has been fulfilled, and it can now be deleted.

Failed: this phase indicates that all containers in the Pod have exited unsuccessfully or with an error, and have not been able to recover. This may require investigation to diagnose and resolve the underlying cause of the failure.

Unknown: this is the phase where the state of the Pod cannot be determined by the Kubernetes control plane, for example, when there is a connection issue between the control plane and the node the Pod is running on.

Create a pod.yml file in you k8s cluster 

# how to create a pod 
kubectl create -f pod.yaml

# how to get the list of pods
kubectl get pods

# how to get pod details
kubectl get pod -o wide

kubectl describe pod pod-name

# how to delete a pod
kubectl delete pod pod-name
