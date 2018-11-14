### check elements in array

* array_contains(Array<T>, value)

```
select *
from tbl
where array_contains(array, "test") = true
```
