A cluster install is in progress.
Please wait until it ends.
Then, all nodes should become ready.

## Task

Now that then cluster is ready, we can begin exploring it.

This is how you can list K8s nodes:

`kubectl get nodes`{{execute}}

You can also list running pods:

`kubectl get pods --all-namespaces`{{execute}}
