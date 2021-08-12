
<div id="k8s" > </div>
## Kubernetes CLI 
```yaml

  ## DEPLOYMENT
  deployment_history:
     kubectl --namespace devbean-dev rollout history deployment.v1.apps/jca-common-customer
     kubectl -n devbean-dev rollout history deployment.v1.apps/jca-common-customer --revision=1
  rollback:
    kubectl rollout undo deployment.v1.apps/jca-common-customer --to-revision=16

  ## POD
  
  ## INGRESS
  
  ## SERVICE (SVC)

  ## SECRET 
  
  ## SERVICE ACCOUNT (SA)

```

### COMMANDS

```bash

$ kubectl get pods -o wide
$ kubectl get pod nginx -o yaml
$ kubectl describe pod nginx


# EXEC

$ kubectl exec nginx -- cat /etc/hosts
# Kubernetes-managed hosts file.
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
fe00::0	ip6-mcastprefix
fe00::1	ip6-allnodes
fe00::2	ip6-allrouters
10.200.0.4	nginx



```





