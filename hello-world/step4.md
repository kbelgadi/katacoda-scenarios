We will now deploy our application.

## Task

Deploy the following YAML K8s manifest to create a k8s Deployment resource:

`
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
`{{execute}}

List existing deployments in your namespace:

`kubectl -n k8s-demo get deployments`{{execute}}

List existing pods in your namespace:

`kubectl -n k8s-demo get pods`{{execute}}

The pod is still in the state `creating`.
Execute the above command until the deployment is ready.
