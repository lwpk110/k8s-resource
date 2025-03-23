# stackable official hive depleyment


## dependencies

- postgresql
- s3

```bash
$ stackablectl \
--stack-file stackablectl-hive-postgres-minio-stack.yaml \
--release-file release.yaml \
stack install hive-minio-postgres
```

## hive stack

```bash
k apply -f dep.yaml

```
