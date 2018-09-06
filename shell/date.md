## shell 에서 date 표현하기

```
date -R
-- 현재의 날짜 및 시간을 가져옴

date --date='-1 month'
한달 전 표현 가능
date --date"$(date +%Y-%m-15) -1 month"

```


https://stackoverflow.com/questions/13168463/using-date-command-to-get-previous-current-and-next-month
