We will now deploy our application.

## Task

Deploy the following YAML K8s manifest to create a k8s Deployment resource: 

```
cat <<EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: demo-app
  namespace: k8s-demo
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: demo-app
    spec:
      containers:
      - name: demo-app
        image: hwdzinn/demospringboot:0.1
        imagePullPolicy: Always
EOF
```{{execute}}

List existing deployments in your namespace:

`kubectl -n k8s-demo get deployments`{{execute}}

Notice that the Deployment resource is labeled with the same label as the service (to make the service/pod wiring possible).

List existing pods in your namespace:

`kubectl -n k8s-demo get pods`{{execute}}

The pod is still in the state `creating`.
Execute the above command until the deployment is ready.

Display the IP address of the backend pod:

`kubectl -n k8s-demo describe service demo-app-svc | grep -i endpoints`{{execute}}

The service endpoints are binded to the Pod IP.
