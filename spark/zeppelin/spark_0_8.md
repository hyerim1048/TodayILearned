https://medium.com/@zjffdu/zeppelin-0-8-0-new-features-ea53e8810235

제플린 0.8.0


Zepplin 0.8.0 driver가 Zeppelin서버에서 도는 게 아니라 yarn cluster에서 도는 yarn cluster 모드 지원.
 * Zeppelin host의 메모리 부담이 적어짐.
 * 사용법 : Zeppelin Spark Interpreter 세팅에서 yarn-cluster로 설정하고 SPARK_HOME 지정
* cluster mode에서는 Isolated PerUser  개인화 옵션 지원함



Ipython Interpreter 지원. 
* Jupyter notebook과 같은 환경 제공


Interpreter Lifecycle Manager

	* 
이전에는 interpreter process 를 죽이려면 interpreter setting page나 note page에서 interpreter를 다시 시작해야 했음
	* 
자원낭비
	* 
lifecycle of interpreter 를 관리할 수 있는 매니저 도입



Hadoop NotebookRepo

	* 
hadoop에 노트북을 저장할 수 있게 지원
	* 
Add org.apache.Zeppelin.notebook.repo.FileSystemNotebookRepo to zeppelin-site.xm



Hadoop Config Storage

	* 
json 형식으로 interpreter setting info 저장 가능 (interpreter.json)
	* 
UI로 세팅 수작업 하지 않아도 됨.



https://medium.com/@zjffdu/zeppelin-0-8-0-new-features-ea53e8810235


Zeppelin에서 Ipython 사용하기
https://www.zepl.com/viewer/notebooks/bm90ZTovL3pqZmZkdS84YjZmZTAzYmE4ZDc0ODg1OTQ0YWM5MDcwYjYyNzQ0Mi9ub3RlLmpzb24




 
