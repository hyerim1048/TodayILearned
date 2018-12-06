### hive 에서  json 여러개 컬럼 선택하기

```
hive >  select v1.Country, v1.Page, v4.impressions_s, v4.impressions_o 
from hive_parsing_json_table hpjp
     LATERAL VIEW json_tuple(hpjp.json, 'country', 'page', 'data') v1
     as Country, Page, data
     LATERAL VIEW json_tuple(v1.data, 'ad') v2
     as Ad
     LATERAL VIEW json_tuple(v2.Ad, 'impressions') v3
     as Impressions
     LATERAL VIEW json_tuple(v3.Impressions, 's' , 'o') v4
```

json 형식으로 된  string 컬럼명을  json_tuple 첫번째 인자에 넣고 
원하는 key 값들을 그 다음 인자로 지정한다.
