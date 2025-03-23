
create schema hive.local_db1;

CREATE TABLE hive.local_db1.tb1 (
  username VARCHAR
);


create schema hive.s3_db3 WITH (
  location = 's3a://lake-house/s3_db3/'
);

CREATE TABLE hive.s3_db3.tb1 (
  username VARCHAR
);

INSERT INTO hive.s3_db3.tb1 VALUES ('local_user1');


create schema "hive-catalog".stackable_db1 with (location = 's3a://stackable/db1');
create TABLE "hive-catalog".stackable_db1.tb1 (
  username VARCHAR
);
INSERT INTO "hive-catalog".stackable_db1.tb1 VALUES ('local_user1');


create schema hive.local_trino_db1 with (location = 's3a://localmode/local_trino_db1');
create TABLE hive.local_trino_db1.tb1 (
  username VARCHAR
);
INSERT INTO hive.local_trino_db1.tb1 VALUES ('local_user1');
