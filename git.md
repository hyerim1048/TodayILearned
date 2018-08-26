
### git

 - 파일을  Committed , Modified, Staged 세가지 상태로 관리함
 - Committed :  데이터가 로컬에 안전하게 저장됨.
 - Modified :  수정한 파일을 로컬에 커밋하지 않은 상태
 - staged :  수정한 파일을 곧 커밋할 것

 directory, working directory , staging area  세가지 단계가 있음
 
 
 #### working directory에서 이미 deleted 된 파일을 master에서 지우기
 ```git
 git add -u
 ```
 [stack overflow](https://stackoverflow.com/questions/492558/removing-multiple-files-from-a-git-repo-that-have-already-been-deleted-from-disk)
