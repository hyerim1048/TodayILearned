### character  제거하기

 [] 제거하기
 
 * 1 
 
 ```
 select regexp_replace(s, "\\[\\d*\\]", "")
  
 ```
* 2
 ```
 select regexp_replace(s, "\\[|\\]", "")
  
 ```


https://community.hortonworks.com/questions/96923/how-to-remove-from-a-column.html
