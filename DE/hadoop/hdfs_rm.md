### hadoop trash 로 파일 보내기

```
hdfs -rm -r [folder]
```
* -r 옵션으로 folder의 파일들을 recursive 하게 지운다.
* 쓰레기통 용량이 파일용량보다 작아서 안지워진다면.. -skipTrash 쓰레기통을 스킵하는 옵션도 있다
* 이 옵션은 조심해서 써야 한다. 파일을 복구할수 없기 때문이다.
