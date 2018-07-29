python


from functools import reduce

primes = [2, 3, 5, 7, 11, 13]

def product(*numbers):
    p = reduce(lambda x, y: x + y, numbers)
    return p

product(*primes)

가변 리스트를전달할 때reduce 는 왼쪽부터 오른쪽 까지 하나하나 더해나가는 연산자이다
"reduce the sequence to a single value"

*primes 를 넣으면  ((((1+2)+3)+4)+5) 값이 나오고
primes 를 그냥 넣으면 그냥 list 그대로 나온다
