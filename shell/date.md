## shell 에서 date 표현하기

```
date -R
-- 현재의 날짜 및 시간을 가져옴

date --date='-1 month'
현재보다 한달 전 표현 가능
date --date"$(date +%Y-%m-15) -1 month"

```


https://stackoverflow.com/questions/13168463/using-date-command-to-get-previous-current-and-next-month

현재 날짜가 아닌 특정 날짜 부터 한달 전 date 가져오기
```
date_id="2018-10-20"
date_id_before=`date --date="$date_id -1 month" +'%Y-%m-%d’`
date_id_before=`date --date="$date_id -15 days" +'%Y-%m-%d’`
echo $date_id_before
```


https://unix.stackexchange.com/questions/153880/regarding-getting-date-n-days-date
