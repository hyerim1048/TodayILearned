mvn 설치
— 최종 mvn 빌드에 사용한 버전 
— 빌드 실패했으나 to_json 사용은 가능한 것으로 확인함.
wget  http://mirror.apache-kr.org/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz

— 지금 설정되어있는 버전
wget https://archive.apache.org/dist/maven/binaries/apache-maven-2.0.9-bin.tar.gz
tar -xvzf apache-maven-2.0.9-bin.tar.gz

hive에서 다음과 같이 입력
add jar /aa/udf_brick/brickhouse-0.7.1-SNAPSHOT.jar;

CREATE TEMPORARY FUNCTION to_json AS 'brickhouse.udf.json.ToJsonUDF’;
https://github.com/klout/brickhouse/blob/master/src/main/resources/brickhouse.hql
