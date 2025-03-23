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
  -f encryption.yaml \
  -f kafka.yaml
```

## monitor

1. install prometheus stack

```bash

$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts


$ helm upgrade prometheus prometheus-community/kube-prometheus-stack --install --version 31.0.0

```

When using the kube-prometheus-stack Helm chart (as above), an additional ServiceMonitor must be applied to the Kubernetes cluster, which discovers services registered to the Kubernetes cluster:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: scrape-label
  labels:
    release: prometheus
spec:
  endpoints:
  - port: metrics
  jobLabel: app.kubernetes.io/instance
  selector:
    matchLabels:
      prometheus.io/scrape: "true"
```

2. port forward

```bash
$ k port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090
```

3. go to http://localhost:9090

4. go to http://localhost:9090/graph

5. search `kafka_*`

## reference

- https://github.com/stackabletech/kafka/blob/main/examples/encryption/README.md