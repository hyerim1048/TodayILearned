### 장고에서 simple image 처리

- pip install pillow
- models.ImageField()
- url에 Media Path 설정
    - 나중에 object.image.url 로 이미지 url을 불러올 수 있음

### DRF Serializers TIPS

- serializer에서 read_only=True로 설정 가능함
- serializer.data
    - 데이터를 json형식 x dictionary 형태로 가지고 있고
    - 이 데이터를 serializer에 넣어주는 형태
- serializer.validated_data
    - valid 데이터 보여줌  (역시 python dictionary)

    from rest_framework.parsers import JSONParser 
    
    stream = io.BytesIO(json) # json
    
    data = JSONParser().parse(stream) # dictionary

- parsers
    - rest_framework에는 많은 종류의 parsers 들이 있는데
        - 어떤 parser를 사용할지 우리가 고민할 필요가 없음
- renderer
    - JSON renderer
    - 역시 많은 renderer가 있으며 browserble renderer 등등
    - 뭘 반환할지도 정해줌

### [views.py](http://views.py) TIPS

@api_view : django rest framework 함수형 뷰를 만들어 줌 (장고의 forms과 비슷)

- whole query set 을 serializer에 넣기 위해서  (many=True)를 넣어준다

        serializer(object.all(),many=True)

- restframework Response
    - 함수 하나로 어떤 html 뷰가 적절할지 select !
- 순서를 보면 view에서
    - model의 object 를 불러오고
    - serializer 호출
    - serializer 가 database 에 model 을 create 하기 전에
    - 적절한 데이터가 들어오는지 확인 (where?)

apiView Class : ModelForm 처럼 class 로 뷰를 가지고 있음 if,else 안써도 되서 편함 

- CBV : class based view
- get_object_or404(Article, pk = pk)

### Serialization Validation

- is_valid() : deserialization step 에서 매우 중요함
- 모델에 들어가기 전에 검증
- serializer.errors 를 통해서 어떤 에러가 났는지 확인 가능
- 모든 validation을 자동으로 체크할 수 없어서 customising 필요함
- Field 안에 validators 를 넣어줌

Validators 

- Field Level Validation
    - 하나의 필드에만 validation 체크 함

        def validate_title(self, value):
        
            if len(value) < 60:
        
             raise serializers.ValidationError("tilte has to be at least 60 characters")

- Object Level Validation
    - using multiple fields

        def validate(self, data): 
        
            if ... :
        
               raise serializers.ValidationErorr("ddang")

### Model Serializer

- 위처럼 Serializer인데
- 이미 create 이미 구현되어 있고
- model 베이스로 해서 serializer 자동 생성
- 자동 validate체크 해준다

        class Meta :
        	model = Article 
        	fields = "__**all__**" # 모든 필드 만들어줘라는 뜻이다
        	exclude = ("id",) # 빼고싶은 필드를 선언할 수도 있다

- extra data를 추가할 수도 있다

    from datetime import datetime 
    from django.utils.timesince import timesince 
    
    class ...(ModelSerializer) :
    	time_since_publication = serializers.SerilaizerMethodField()
    
    def get_time_since_publication(self, object):
        pass # 여기에 구현 

- serializer 형태 체크!

    print(repr(serializer))

### nested relationship

- e.g. journalist 시리얼라이저에 아티클들을 다 포함시키고 싶다면?
    - ArticleSerilizer(many=True, read_only=True) 로 선언하니까 그냥 바로 nested로 뽑아
    - HyperlinkedRelatedField() : 위의 json을 링크 형태로 반환
