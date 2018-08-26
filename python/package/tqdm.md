### tqdm


- tqdm : 아랍어로 "progress"를 뜻함. 스페인어로는 "I love you so much"를 뜻한다고 함...
- iterable한 객체에 tqdm을 씌우면 진행 사항을 편하게 확인할 수 있음.

### pandas 와 함께 확인하기 


```python
import pandas as pd
import numpy as np
from tqdm import tqdm

# 데이터 프레임 만들기
df = pd.DataFrame(np.random.randint(0, 100, (100000, 6)))

# Register `pandas.progress_apply` and `pandas.Series.map_apply` with `tqdm`
# (can use `tqdm_gui`, `tqdm_notebook`, optional kwargs, etc.)
tqdm.pandas(desc="my bar!")

# apply함수 대신에 progress_apply를, map 대신에 progress_map을 사용하면 tqdm을 같이 확인할 수 있음.
df.progress_apply(lambda x: x**2)
# can also groupby:
# df.groupby(0).progress_apply(lambda x: x**2)
```
