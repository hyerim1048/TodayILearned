## dataclasses package 
소스 코드: Lib/dataclasses.py 

* __init__() 이나 __repr__() 과 같은 특수 메소드를 자동으로 추가하는 데코레이터와 함수 제공 (PEP557)
  * Special method : 파이썬 type에 어떤 연산을 할 때 암묵적으로 호출되는 method 이다. 두개의 밑줄로 시작하며, [이 링크](https://docs.python.org/ko/3/reference/datamodel.html#specialnames) 에서 확인할 수 있다.


```
@dataclass
class InventoryItem:
    '''Class for keeping track of an item in inventory.'''
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand
```

* 이 코드에 다음과 같은 __init__()을 추가함 

```python 
def __init__(self, name: str, unit_price: float, quantity_on_hand: int=0):
    self.name = name
    self.unit_price = unit_price
    self.quantity_on_hand = quantity_on_hand
```

## References
(python dataclasses 문서)[https://docs.python.org/ko/3/library/dataclasses.html]
