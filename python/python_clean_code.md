[zedr/clean-code-python](https://github.com/zedr/clean-code-python#introduction)

# Variables

### Meaningful and Pronounceable variable names

- 의미있는 변수명 사용하기

    current_date: str = datetime.date.today().strftime("%y-%m-%d")

# Functions

### Function arguments (2 or fewer ideally)

- 함수의 인자는 2개 이하인 게 좋다. 그래야 test하기 쉽다
- 인자가 많다는 건 그만큼 많은 일을 하고 있다는 것이니 class를 이용해라

### bad

- create_menu에 엄청 많은 인자들이 들어가고 있음

    def create_menu(title, body, button_text, cancellable):
        # ...

### good

- menu 클래스를 생성해서 config를 dict로 넣어줌

    class Menu:
        def __init__(self, config: dict): # 넣을 인자를 dict로 묶어줌 
            title = config["title"]
            body = config["body"]
            # ...
    
    # menu에 필요한 인자를 넣어줌 
    menu = Menu( 
        {
            "title": "My Menu",
            "body": "Something about my menu",
            "button_text": "OK",
            "cancellable": False
        }
    )

### Also good

- config type-check를 위해서 MenuConfig 객체를 생성한 후 menu 생성

    class MenuConfig: # 주석 # Attributes 
        """A configuration for the Menu.
    
        Attributes:
            title: The title of the Menu.
            body: The body of the Menu.
            button_text: The text for the button label.
            cancellable: Can it be cancelled?
        """
        title: str # variable type 명시
        body: str
        button_text: str
        cancellable: bool = False
    
    
    def create_menu(config: MenuConfig):
        title = config.title
        body = config.body
        # ...
    
    
    config = MenuConfig
    config.title = "My delicious menu"
    config.body = "A description of the various items on the menu"
    config.button_text = "Order now!"
    # The instance attribute overrides the default class attribute.
    config.cancellable = True
    
    create_menu(config)

### Fancy

- typing으로 namedtuple 생성해서 type-check

    from typing import NamedTuple
    
    
    class MenuConfig(NamedTuple):
        """A configuration for the Menu.
    
        Attributes:
            title: The title of the Menu.
            body: The body of the Menu.
            button_text: The text for the button label.
            cancellable: Can it be cancelled?
        """
        title: str
        body: str
        button_text: str
        cancellable: bool = False
    
    
    def create_menu(config: MenuConfig):
    		**# 각 변수에 할당, config를 여러 번 쓸 필요가 없네**
        **title, body, button_text, cancellable = config** 
        # ...
    
    
    # 객체 생성과 동시에 함수에 할당
    create_menu(
        **MenuConfig(
            title="My delicious menu",
            body="A description of the various items on the menu",
            button_text="Order now!"
        )**
    )

### Even Fancier

- dataclasses 사용하기

    from dataclasses import astuple, dataclass
    
    
    @dataclass
    class MenuConfig:
        """A configuration for the Menu.
    
        Attributes:
            title: The title of the Menu.
            body: The body of the Menu.
            button_text: The text for the button label.
            cancellable: Can it be cancelled?
        """
        title: str
        body: str
        button_text: str
        cancellable: bool = False
    
    def create_menu(config: MenuConfig):
        title, body, button_text, cancellable = astuple(config)
        # ...
    
    
    create_menu(
        MenuConfig(
            title="My delicious menu",
            body="A description of the various items on the menu",
            button_text="Order now!"
        )
    )

## Functions should do one thing

- the most important rule !
- isolate it please!
