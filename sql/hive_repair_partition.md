### hive 에서 location 지정하지 않고 자동으로 partition repair 하기

* hive 는  partition list 를  metastore 로 보관하는데
* 새로운 partition 이 생겨나거나 하면 hdfs 는 모를 수 있음.
* alter table table_name add/drop partition 을 쓰지 않고

```
msck repair table table_name;
```
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-RecoverPartitions(MSCKREPAIRTABLE)
