# useradd

- [https://www.tecmint.com/add-users-in-linux/](https://www.tecmint.com/add-users-in-linux/)
- edits /etc/passwd, /etc/shadow, /etc/group, /etc/gshadow for the new user
- create and populate a home directory for the new user
- set permissions and ownerships to home directory
- check whether a user exists :

    [https://linuxize.com/post/how-to-list-users-in-linux/](https://linuxize.com/post/how-to-list-users-in-linux/)

        getent passwd  | grep deploy

- add user
    - deploy user 를 root로 새로 만든다
    - 7 colored seperated fields in passwd
        - Username
        - password(/etc/shadow in ecrypted format)
        - uid : by default UID - for root user, 1-99 for predefined, 100-999 for system accounts and groups
        - groupid (/etc/group)
        - user_info
        - home_directory
        - absolute location of a user's shell e.g. /bin/bash

                useradd deploy
                
                getent passwd  | grep deploy 
                >> deploy:x:1000:1001::/home/deploy:/bin/sh
                
                passwd deploy 
                >> deploy:x:1000:1004::/home/deploy:/bin/sh

- group 지정
    - -G [group1, group2,...] username
    - -s : shell 종류 설정

# chmod

[https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/](https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/)

- modify Linux file permissions
- by using ls -l  : list the file permissions
- 1st char : (-) - file / (d) - directory
- 1st three characters : the permissions for the user who onws the file (user permission)
- 2nd three : for members of the file's group (group permission)
- last :  anyone (other permissions)
- —- : no permissions, rwx : full permissions
- 0: (000) No permission.
- 1: (001) Execute permission.
- 2: (010) Write permission.
- 3: (011) Write and execute permissions.
- 4: (100) Read permission.
- 5: (101) Read and execute permissions.
- 6: (110) Read and write permissions.
- 7: (111) Read, write, and execute permissions.

# sed

- [https://stackoverflow.com/questions/18527365/what-does-sed-i-option-do](https://stackoverflow.com/questions/18527365/what-does-sed-i-option-do)
- sed : just print  "p" to 0 in file.txt not redirecting

    sed 's/"p"/0/g' file.txt > file.txt

- -i : inplace redirecting 해서 실제로 바꿈
