We will now create a service to access to the application.

## Task

Deploy the following YAML K8s manifest to create a service:

```
cat <<EOF | kubectl apply -f -
kind: Service
apiVersion: v1
metadata:
  name: demo-app-svc
  namespace: k8s-demo
  labels:
    app: demo-app
spec:
  type: ClusterIP
  selector:
    app: demo-app
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
EOF
```{{execute}}

List existing services:

`kubectl -n k8s-demo get services`{{execute}}

Notice that the service has been provided with a virtual IP (ClusterIP).

Display the IP address of the backend pod:

`kubectl -n k8s-demo describe service demo-app-svc | grep -i endpoints`{{execute}}