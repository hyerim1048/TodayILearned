# Gatsby로 블로그 만들기 

Created: Sep 22, 2019 1:55 PM
Topic: Computer

## 정적 사이트 생성기?

[nacyot의 프로그래밍 이야기 :: 정적 웹사이트 생성기의 역습 - 동적 스크립트를 넘어 다시 정적 컨텐츠로](https://blog.nacyot.com/articles/2014-01-15-static-site-generator/)

Gatsby pages 

/src/pages 

JSX : HTML in JS. gatsby sites 가 브라우저가 이해할 수 있는 형태로 변환

## Building with components

- react components : self contained pieces of code (usually written with JSX) → accept input and return React elements (a section of UI)
    - CSS, HTML, JS 가 같은 파일에 섞이게 됨

## Using page components

pages 안에 있는 *.js 파일이 자동으로 페이지를 생성한다 

## Using sub-components

- page가 커졌을 때 UI를 reusable pieces 로 쪼갤 수 있다
- components/header.js

## Using layout-components

- 공통의 layout을 묶어주는 역할을 한다. (footer와 header 같은 )
- 

## Liking other pages

- gatsby 를 이용해서 페이지를 연결해보자

    <Link to="/page-2/">Go to page 2</Link>

$$H(x)$$

# 4. Data in Gatsby

[Gatsby 로 Blog 만들기](https://medium.com/@pks2974/gatsby-%EB%A1%9C-blog-%EB%A7%8C%EB%93%A4%EA%B8%B0-ac3eed48e068)

[Gatsby를 활용한 블로그 재구성](https://rinae.dev/posts/creating-new-blog-with-gatsby)

# netlify 로 github 자동배포하기

[Netlify를 이용하여 Gatsby 블로그 자동 배포하기](https://anpigon.github.io/blog/kr/@anpigon/netlify-gatsby--1545785934223/)

## gatsby - katex

- gatsby-config 에 추가해주면 된다.

    npm install --save gatsby-transformer-remark gatsby-remark-katex katex

[](https://www.gatsbyjs.org/packages/gatsby-remark-katex/?=latex)

## gatsby - 테마

내가 사용한 테마는 

[narative/gatsby-theme-novela](https://github.com/narative/gatsby-theme-novela/tree/master/%40narative/gatsby-theme-novela#adding-your-logo)

[https://gatsby-dimension.surge.sh/](https://gatsby-dimension.surge.sh/)

[https://github.com/codebushi/gatsby-starter-dimension](https://github.com/codebushi/gatsby-starter-dimension)

## Gatsby-plugin-typescript

- 테마가 타입스크립트로 만들어져 있어서 간단한 코드를 살펴보았다.
- 타입스크립트란?
- 자바스크립트에 타입을 명시할 수 있는 정적 타입 언어이자 컴파일 시점에 타입을 검사할 수 있는 컴파일 언어이다.

[01. Typescript란](https://skout90.github.io/2017/08/12/Typescript/1.%20typescript%EB%9E%80/)

[](https://www.gatsbyjs.org/packages/gatsby-plugin-typescript/)

[Getting started with Typescript on Gatsby](https://medium.com/maxime-heckel/getting-started-with-typescript-on-gatsby-8544b47c1d27)

### React 와 Typescript 사용하기

[React에서 Typescript 사용하기](https://dev-yakuza.github.io/ko/react/typescript/)

## shadowing

- gatsby에서 overriding 하고 싶은 테마의 소스코드를 덮어 쓸 수 있다.
- 단, 로컬 코드를 상대 경로를 통해 불러오는 경우 그 코드도 같이 복사해주어야 한다

[Shadowing in Gatsby Themes](https://www.gatsbyjs.org/docs/themes/shadowing/)

## gatsby - disqus 추가하기

1) 먼저 추가하고 싶은 article template 을 복사해서 가져온다. 

2) disqus 플러그인 설치 후 불러온다. 

[](https://www.gatsbyjs.org/packages/gatsby-plugin-disqus/)

    import { Disqus, CommentCount } from "gatsby-plugin-disqus";
    
    const disqusConfig = {
        url: `${ "https://plimground.netlify.com" + location.pathname}`,
        identifier: article.id,
        title: article.title,
      }
    
    <Disqus config={disqusConfig} />

### disqus 마진 등 css 수정하는 방법

## 기타

- contents를 관리할 수 있는 시스템이 있다.
- contentful 이나 netlify 에서 제공하는 것도 그 중 하나이다
- 사용 결과, notion을 쓰는 것이 제일 편한 것 같다.

[Sourcing from Netlify CMS](https://www.gatsbyjs.org/docs/sourcing-from-netlify-cms/)