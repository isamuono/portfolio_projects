var aElement = document.getElementById( "target" ) ;

// classNameを取得 ( → "syncer arayutw squirrel" )
var className = aElement.className ;

// classNameを変更 ( → <a id="target" class="apple orange">SYNCER</a> )
var myfunc = function(){
    var aElement = document.getElementById("target");
    aElement.className = "apple-orange" ;
}


//現在のページのURLの取得
var url = document.location.href;
 
console.log( url );


//JavaScriptの既存メソッドのaddEventListenerを使用し、
//任意の要素にイベントリスナーを登録
var button = document.getElementById("mybutton");
 
    var myfunc = function(){
      console.log("addEventListenerを使用しました");
    }
 
    button.addEventListener("click",myfunc);


//「change」によるイベント処理
var form = document.forms.myform;
 
form.sample.addEventListener('change', function() {
    console.log('状態が変化しました！');
}, false);