### csv to hive table 

1. put csv file to a folder on hdfs


2. add location

CREATE TABLE aa.tbl
(cate_id int
,1depth	 string
,2depth	string
) row format delimited fields terminated by ',' STORED AS TEXTFILE LOCATION '/aa/aa.db/ad_cross2';
