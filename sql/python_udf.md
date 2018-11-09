### python으로 UDF 만들기

1. Add python files to hdfs
```
ADD FILE test.py;
```

2. python udf 
```python

for line in sys.stdin:
    line=line.strip()
    a,b,c,d,e = line.split("\t")
    tmp = {"a": a, "b":b, "c":c}
    print a, b, ujson.dumps(f)
```

3. transform hive sql
```sql
SELECT TRANSFORM ( a, b, c, d, e )
USING 'python ./test.py'
AS ( a string , b string , f STRING )
FROM test_data
```

https://github.com/zaratsian/hive_udf/blob/master/hive_udf_addfile.py
