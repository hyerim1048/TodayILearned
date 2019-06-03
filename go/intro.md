# Go

---

- 2009년에 Google에서 만든 언어
- 컴파일 언어
- 동시성을 잘 지원한다는 특징이 있음
    - Goroutine (lightweight thread) 와 고루틴 간 메시지를 주고받을 수 있는 channel을 이용하면 동시성 프로그램 개발이 쉬움
- 인터넷을 기본 개발환경으로 하며 코드를 저장하고 읽기 위해서는 git서버가 있어야 함

    go get github.com/mattn/go-sqlite3

- 모든 프로그램은 패키지로 구성되어 있고, main 패키지에서부터 실행 시작

    package main
    
    import (
        "fmt"
        "math"
    )
    
    func main() {
        fmt.Printf("Now you have %g problems.",
            math.Nextafter(2, 3))
    }

- loop는 for 만 존재

출처 : [https://golangkorea.github.io/post/go-start/getting-start/](https://golangkorea.github.io/post/go-start/getting-start/)

[https://go-tour-kr.appspot.com/#41](https://go-tour-kr.appspot.com/#41)
