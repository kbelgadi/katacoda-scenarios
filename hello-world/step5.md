Let's create a namespace first.
This should let us organize our deployments over the cluster.

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
