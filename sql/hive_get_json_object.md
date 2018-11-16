
### get_json_object


json 형태일 경우 다음과 같은 함수를 사용한다.
json serde를 사용하지 않고 json 모양의 string이어도 작동함.

get_json_object
https://docs.microsoft.com/ko-kr/azure/hdinsight/hadoop/using-json-in-hive

* map<string> 은 jsin 형태가 아니니까 key:value 로 접근가능. map["key"]
* json 형태는 get_json_object(json_val, '$.key.date_id')

