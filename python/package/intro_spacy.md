### spacy?

- new framework in the Python NLP environment
- written in Cython

spacy를 시작하기 위해서 먼저 pip를 통해 다운을 받는다. 
영어 모델을 자동적으로 다운받지는 않으며 필요하다면 명령어를 통해 다운을 받는다.

```python
pip install -U spaCy
python -m spacy download en
```

tokenization 을 통해서 단어들 뿐만이 아니라 공백도 token으로 가지고 있는다.

```python

import spacy
nlp = spacy.load('en')
doc = nlp('Hello     World!')
for token in doc:
    print('"' + token.text + '"')
 
# "Hello"
# "    "
# "World"
# "!"
```

또한 NLTK 와 다른 점은, spacy는 아래의 예시에서 보듯이, 단어와 원래의 텍스트에서의 위치를 link의 형태로 기억해 놓는다.


```python

import spacy
nlp = spacy.load('en')
doc = nlp('Hello     World!')
for token in doc:
    print('"' + token.text + '"', token.idx)
 
# "Hello" 0
# "    " 6
# "World" 10
# "!" 15
```

이 외에도 document를 확인해 보면, Token class 는 단어 단위의 여러 속성들을 가지고 있다.

[spacy Documentation](https://nlpforhackers.io/complete-guide-to-spacy/)




