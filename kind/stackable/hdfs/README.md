# stackable hdfs

## 启用 kerberos 的 hdfs 环境

查看 kerberos 中被创建的主体记录：

```bash
(base) ➜  hdfs git:(main) ✗ kadmin -p admin/admin -kt /tmp/admin.keytab 
Couldn't open log file /var/log/kadmin.log: 权限不够
Authenticating as principal admin/admin with keytab /tmp/admin.keytab.
kadmin:  listprincs
HTTP/simple-hdfs.hdfs.svc.cluster.local@WHG.CN
K/M@WHG.CN
admin/admin@WHG.CN
dn/simple-hdfs.hdfs.svc.cluster.local@WHG.CN
foo@WHG.CN
jn/simple-hdfs.hdfs.svc.cluster.local@WHG.CN
kadmin/admin@WHG.CN
kadmin/changepw@WHG.CN
krbtgt/WHG.CN@WHG.CN
nn/simple-hdfs.hdfs.svc.cluster.local@WHG.CN
kadmin:  
```