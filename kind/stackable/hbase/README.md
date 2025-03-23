# stackable hbase

## 注意点

master节点启动报错 `org.apache.hadoop.security.AccessControlException: Permission denied: user=hbase, access=WRITE, inode="/":nn:supergroup:drwxr-xr-x` 时，需要在hdfs中手动创建 `hbase` 目录，这个步骤和hbase的配置 `hbase.rootdir` 相关联， 创建hbase 目录后将 kerberos 的hbase用户权限赋给这个目录，然后重新启动 hbase master
，相关可以参阅 [Hbase Securing Access to HDFS and ZooKeeper](https://hbase.apache.org/book.html#_securing_access_to_hdfs_and_zookeeper).
