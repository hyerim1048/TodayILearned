multiple table (3개 이상 테이블을 Join할 때 조심해야할 것 )

https://stackoverflow.com/questions/16167902/multiple-full-outer-join-on-multiple-tables

아래와 같이 join하려는 테이블의 1번째 column 값이 null일 경우 join이 제대로 되지 않기 때문에, coalsesce를 통해서 t1 의 key가 null일 경우
t2 키와 다시한번 매핑 시켜주어야 한다.




SELECT  A.column2
        , B.column2
        , C.column2
FROM 
(
    (SELECT month, column2 FROM table1) A
    FULL OUTER JOIN
    (SELECT month, column2 FROM table2) B on A.month= B.month
    FULL OUTER JOIN 
    (SELECT month, column2 FROM table3) C on coalesce(A.month, B.month) = C.month
)
