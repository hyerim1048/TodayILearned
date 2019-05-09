- 어떻게 스크랩할것인지 class로 정의 가능함
- 순서
    1. initial Requests to crawl the first URLs + specify a callback fun : reponse 뒤에 행해질 함수

         ( e.g. **start_requests()** : generates request and parse : callback function) 

    2. parsing response → return dicts with extracted data 

    (Item , Request, iterable of these ) → 다시 콜백

    3. parse contents using Selectors (like beautifulSoup) and generate data 

    4. persisted to a database ( Item Pipeline )

       [https://doc.scrapy.org/en/latest/topics/item-pipeline.html#topics-item-pipeline](https://doc.scrapy.org/en/latest/topics/item-pipeline.html#topics-item-pipeline)

start_requests 

### Request objects 의 meta

- a dict → arbitrary metadata for this request

[https://www.accordbox.com/blog/how-crawl-infinite-scrolling-pages-using-python/](https://www.accordbox.com/blog/how-crawl-infinite-scrolling-pages-using-python/)

[https://towardsdatascience.com/nlp-extract-contextualized-word-embeddings-from-bert-keras-tf-67ef29f60a7b](https://towardsdatascience.com/nlp-extract-contextualized-word-embeddings-from-bert-keras-tf-67ef29f60a7b)
