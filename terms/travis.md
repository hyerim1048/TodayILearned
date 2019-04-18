## travis and CI

### Continuous Integration
* merging in small code changes frequently 
* travis CI supports development process by automatically building and testing code changes , feedback 

### building, testing, deploying
* one or more of tasks fails -> broken
* none of the tasks fail -> passed

### terms in Travis CI
* phase - sequential steps of a job (e.g. deploy, script, deploy)
* job - an automated process that clones repo into a virtual env. 
* build - a group of jobs 
* stage - a group of jobs that run in parallel as part of sequential build process 

https://docs.travis-ci.com/user/for-beginners
https://docs.travis-ci.com/user/tutorial/
