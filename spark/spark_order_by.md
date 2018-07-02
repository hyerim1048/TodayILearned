spark dataframe API 에서 multiple keys 로 order by 하기
 * comma를 통해 넣어주면 되고, desc함수를 통해 개별적으로 내림차순, 오름차순을 정할 수 있다.

df.orderBy(desc("foo"), "bar")

spark dataframe에서 string 포함 여부 찾기


df.filter($"foo".contains("bar"))
