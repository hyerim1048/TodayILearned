

### list comprehension flatting 이해하기

```python
list_of_lists = [(1,2,3),(2,3,4),(3,4,5)]
[item for sublist in list_of_lists for item in sublist]
```

기본 for 문

```python

list_of_lists = [(1,2,3),(2,3,4),(3,4,5)]
test = []
for sublist in list_of_lists:
    for item in sublist:
        test.append(item)
```

generator
```python
for item in sublist:
    (item for sublist in list_of_lists)
```

list 를 생성하지 않는다는 것만 빼면 위는 list comprehension과 같은 역할을 하는 generator 이다.

https://stackoverflow.com/questions/24586757/understanding-list-comprehension-for-flattening-list-of-lists-in-python
다양한 방법들이 많다.
https://winterj.me/list_of_lists_to_flatten/


## if-else 
To use if-else in "list comprehension"
```
[a if a else 2 for a in [0,1,0,3]]
```

