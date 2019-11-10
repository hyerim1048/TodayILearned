# kube - persistent data

Created: Nov 05, 2019 11:02 AM

## Persistent Volume Claim

    
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: pvc-example
    spec:
      accessModes:
        - ReadWriteOnce
      storageClassName: ssd
     resources:
       requests:
         storage: 4Gi 

- accessModes : Pod이 스토리지에 접근하는 방식 .Read/Write Node를 하나로 제한한다는 뜻
- ReadOnlyMany, ReadWriteMany : 플랫폼에 따라 사용할 수 엾는 경우도 있긴함
- storageClassName :
    - storageClass 리소스의 종류
        - 어떤 스토리지를 사용할지를 정의
        - Pods이 pvc를 직접 마운트할 수 있고 데이터를 넣으면 파드를 다시 생성해도 app의 상태가 유지됨

### StorageClass

- Persistent Volume 확보한 스토리지의 종류를 정의하는 리소스
