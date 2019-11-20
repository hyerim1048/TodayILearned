## functional and class

- 16.8 이후 class 선언 없이 react feature를 사용할 수 있게 됨
- 그래서 함수형을 많이 씀
    - [https://reactjs.org/docs/hooks-intro.html](https://reactjs.org/docs/hooks-intro.html)
    - [https://overreacted.io/how-are-function-components-different-from-classes/](https://overreacted.io/how-are-function-components-different-from-classes/)

* function
```
    import React from 'react';
    import logo from './logo.svg';
    import './App.css';
    
    function App() {
      return (
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <p>
              Edit <code>src/App.js</code> and save to reload.
            </p>
            <a
              className="App-link"
              href="https://reactjs.org"
              target="_blank"
              rel="noopener noreferrer"
            >
              Learn React
            </a>
          </header>
        </div>
      );
    }
    
    export default App;
    
    ```
    * class 
    ```
    import React from 'react';
import logo from './logo.svg';
import './App.css';
 
class App extends React.Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
      </div>
    );
  }
}
 
export default App;
```
    
    
### Hello.js

- react 를 import 하고 html like 한 jsx 로 html 컴포넌트를 정의한다
- 이 virtual dom 을 통해 real dom 을 바꾼다
- jsx 의 className : js 에 이미 class라는 예약어가 있기 때문에 jsx에서는 className 을 사용한다
- tachyon 이라는 library를 통해 css를 쉽게 정의할 수 있다
    - 디자이너가 없는 상태에서는 괜찮은 옵션인 듯 하다
- export : react component 를 다른데서 쓸 수 있게 export 하는 부분이다
- default : 하나의 component 만 file에 존재할 때 export default Component Name 을 입력한다

```
import React, { Component } from 'react';
import './Hello.css';

// React.Component 대신에 
/*
const Hello = (props) => {
    return 
    props.greeting
}
*/
class Hello extends Component {
    // what to return
    render() {
        return (
        <div className = 'f1 tc'>
            <h1>Hello World</h1>
            <p>{this.props.greeting}</p>
        </div>
    );
    }
}

// why class name not class? 
 // how to use html? this is not html, jsx 
 // html like javascript 
 // using virtual dom to change real dom 
 // class is reserved keyword in js so dont use class instead of className 
  

// export  to use 
// default : this file exports one thing 
export default Hello; 

//  Line 9:5:  Expected an assignment or function call and instead saw an expression  no-unused-expressions

// css faster than// booster really nice??
```


