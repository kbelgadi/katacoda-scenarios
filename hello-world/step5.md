We can now request our application.

## Task

Get the IP and Port of the K8s service:

To get the IP, execute the following command:

`
DEMO_APP_IP=$(kubectl -n k8s-demo get svc -l app=demo-app -o json | jq -r '.items[0].spec.clusterIP')`{{execute}}

To get the Port, execute the following command:

`
DEMO_APP_PORT=$(kubectl -n k8s-demo get svc -l app=demo-app -o json | jq -r '.items[0].spec.ports[0].port')`{{execute}}

Then, request the application as following:

`curl -s ${DEMO_APP_IP}:${DEMO_APP_PORT}/v1/demo/1234/info | jq`{{execute}}
