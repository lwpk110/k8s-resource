# kafka officail starter

## install

1. intall dependencies and kafka crd

```bahs
stackablectl operator install \
  commons=24.7.0 \
  secret=24.7.0 \
  listener=24.7.0 \
  zookeeper=24.7.0 \
  kafka=24.7.0
```

2. apply them

```bash
k apply -f zookeeper.yaml \
  -f kafka-znode.yaml \
  -f kafka.yaml
```
