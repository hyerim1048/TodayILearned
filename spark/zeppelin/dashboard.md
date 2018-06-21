정리 링크 : https://app.additor.io/p/WBPmejQC

##frontend API

Bind/Unbind Variables


%angular

<form class="form-inline">
  <div class="form-group">
    <label for="superheroId">Super Hero: </label>
    <input type="text" class="form-control" id="superheroId" placeholder="Superhero name ..." ng-model="superhero"></input>
  </div>
  <button type="submit" class="btn btn-primary" ng-click="z.angularBind('superhero',superhero,'20160222-232336_1472609686')"> Bind</button>
</form>


Angularjs view 에 variable을 bind할 수 있고, mandatory target paragraph도 지정할 수 있다.



Run Paragraph


%angular

<form class="form-inline">
  <button type="submit" class="btn btn-primary" ng-click="z.runParagraph('paragraph_id')"> Run Paragraph</button>
</form>
'paragraph_id' : zeppelin 각 paragraph 우측 상단의 settings 버튼을 눌러보면, paragraph_id가 있는데

이 아이디를 넣어주면 이 버튼을 클릭할 때 그래프를 자동으로 reset해준다. 





Angular frontend API vs Backend API 비교 
(https://i.imgur.com/8fu71T3.png)



## backend API


spark에서 아래와 같이 import 한다. 



// In notebook scope
import org.apache.zeppelin.display.angular.notebookscope._
import AngularElem._


html tag.display를 하면 바로 string으로 zeppelin에 출력된다.



<div style="color:blue">
  <h4>Hello Angular Display System</h4>
</div>.display




%spark
// clear previously created angular object.
AngularElem.disassociate

// on click후 callback함수를 넣어주게 된다.
// 
val button = <div class="btn btn-success btn-sm">Submit</div>.onClick{() =>
  val inputString = AngularModel("input")().toString // model값을 string으로
  AngularModel("title", inputString.toUpperCase)
}

<div>
  { <h4> {{{{title}}}}</h4>.model("title", "Please type text to convert uppercase") } // initial value "Pttcu" and model name is title
   Your text { <input type="text"></input>.model("input", "") } // input tag에 input model 이름을 붙여준 후에 initial value넣어줌.
  {button}
</div>.display
