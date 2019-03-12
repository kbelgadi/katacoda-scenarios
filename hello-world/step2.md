Let's create a namespace first.

This will allow us to organize our deployments on the cluster.

## Task

Deploy the following YAML K8s manifest:

`
cat <<EOF | kubectl apply -f -
kind: Namespace
apiVersion: v1
metadata:
  name: k8s-demo
EOF
`{{execute}}

List existing namespaces:

`kubectl get namespaces`{{execute}}

Notice the new namespace in the displayed list.