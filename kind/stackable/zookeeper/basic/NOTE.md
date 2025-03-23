# zookeeper official

## install dependencies

nstall the ZooKeeper Operator and its dependencies:

```bash
stackablectl operator install \
  commons=24.7.0 \
  secret=24.7.0 \
  listener=24.7.0 \
  zookeeper=24.7.0
```

## deploy zookeeper

1. create zk cr file named `simple-zk.yaml`:

```bash
---
apiVersion: zookeeper.stackable.tech/v1alpha1
kind: ZookeeperCluster
metadata:
  name: simple-zk
spec:
  clusterConfig:
    listenerClass: external-unstable
  image:
    productVersion: 3.9.2
  servers:
    roleGroups:
      default:
        replicas: 3
```

2. apply it

```bash
kubectl apply -f simple-zk.yaml
```

## deploy znode

1. create znode cr file named `simple-znode.yaml`:

```bash
---
apiVersion: zookeeper.stackable.tech/v1alpha1
kind: ZookeeperZnode
metadata:
  name: simple-znode
spec:
  clusterRef:
    name: simple-zk
```

2. apply it

```bash
kubectl apply -f simple-znode.yaml
```

3. check if znode created

```bash
$ kubectl run my-pod \
  --stdin --tty --quiet --restart=Never \
  --image docker.stackable.tech/stackable/zookeeper:3.9.2-stackable24.7.0 -- \
  bin/zkCli.sh -server simple-zk-server-default:2282 ls / > /dev/null && \
  kubectl logs my-pod && \
  kubectl delete pods my-pod
  
```
