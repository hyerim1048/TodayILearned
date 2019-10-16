# [python] modules and packages

Created: Oct 15, 2019 6:18 PM
Project: Datarize
Topic: Computer,Python

[6. Modules - Python 3.8.0 documentation](https://docs.python.org/3/tutorial/modules.html)

- for maintenance, splitting scripts !
- 우선 모듈의 이름은 [fibo.py](http://fibo.py) 를 생성하면 'fibo', 즉 파일 이름이 된다.
- 모듈은 보통 이런 파이썬 파일 하나하나를 의미하는 것 같다

# Packages

- package 는 모듈의 namespace를 구조화하는 방법이다 ("dotted module names")
- 예를 들어 A.B라고 했을 때에 B는 A의 sub-module 이다.

- module 을 import할 때 python 은 sys.path 를 훑어가면서 package subdirectory를 찾는다
- 그리고 그때, init 파일은 해당 디렉토리를 python이 패키지로 인식하게 만든다

    sound/                          Top-level package
          __init__.py               Initialize the sound package
          formats/                  Subpackage for file format conversions
                  __init__.py
                  wavread.py
                  wavwrite.py
                  aiffread.py
                  aiffwrite.py
                  auread.py
                  auwrite.py
                  ...
          effects/                  Subpackage for sound effects
                  __init__.py
                  echo.py
                  surround.py
                  reverse.py
                  ...
          filters/                  Subpackage for filters
                  __init__.py
                  equalizer.py
                  vocoder.py
                  karaoke.py
                  ...

- 이 파일이 비어 있어도 괜찮다

## package를 부르는 방법

    import sound.effects.echo
    
    # 이 방법은 package prefix를 언급하지 않아도 되어 편하다
    from sound.effects import echo 
    
    # 파일 내의 function, variable, class 을 바로 불러올 수도 있다.
    from sound.effects.echo import echofilter
    

- from package import item 으로 어떤 item이든 불러올 수 있는데 먼저 해당 package 안에 import할 item이 있는지 찾아보고 없으면 ImportError 를 낸다
- 반대로 그냥 import (import item.subitem.subsubitem) 만 쓸 때는 마지막을 제외하고는 다 패키지여야 한다

## Importing * From a Package

- 패키지 안의 전체 모듈을 불러오고 싶을 때는 어떻게 할까?
    - 자동으로 python이 그 디렉토리로 가서 모든 모듈을 찾아주면 좋겠지만
    - 그건 어떤 부작용이 발생할지 모르니 보통은 Package를 만든 사람이 명시적으로 제공해준다.
    - init 파일에 명시할 수 있는데 다음과 같이 하면 된다.

    __all__ = ["echo", "surround", "reverse"]

- 이렇게 명시하지 않으면 모든 모듈을 한번에 불러올 수 없다.

## Intra-package References

- relative import를 할 수 있는데 현재 모듈의 이름을 근거로 한다

    from . import echo
    from .. import formats
    from ..filters import equalizer