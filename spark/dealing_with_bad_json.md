1) read.json(Dataset[String]) : https://stackoverflow.com/questions/49088401/spark-from-json-with-dynamic-schema
2) dealing with bad recods : https://docs.databricks.com/spark/latest/spark-sql/handling-bad-records.html

### 서로 상이한 데이터들이 모여있는 경우 
* 그냥 read_schema 를 하면 스키마가 다른 JSON을 filtering 할 때 에러 발생 
* Dataset 을 구성하고 그 Dataset을 read.json() 로 읽어온다면? 

