### 하둡  db 용량 확인하기

hdfs fs -du -s -h /filepath/work.db


### hadoop -rm option
hdfs -rm -r : directory
hdfs -rm -r -skipTrash :  조심해야함. Trash 가 다 찼을 때 바로 삭제함. 쓰지 않는게 좋으나 내 쿼터를 넘어서서 너무 큰 데이터만 사용


