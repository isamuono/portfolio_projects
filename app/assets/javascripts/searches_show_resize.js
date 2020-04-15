var resizeFlg;    //setTimeoutの待機中かを判定するフラグ

function windowResizeFunc(){

  //resizeFlgに値が設定されている場合は、待ち時間中なのでリセットする
  if (resizeFlg !== false) {
      clearTimeout(resizeFlg);
  }
  //300ms待機後にリサイズ処理を実施する
  resizeFlg = setTimeout( function() {
      resizeElement();    //リサイズを実施する処理
  }, 300);
}
window.addEventListener("resize", windowResizeFunc);
window.addEventListener('load', categorySet());
window.addEventListener('load', resizeElement());

function resizeElement(){
  const windowWidth = document.documentElement.clientWidth;
  const windowHeight = document.documentElement.clientHeight;

  const resizebox = document.getElementById("resizebox");
    if (windowWidth <= 666) {
      resizebox.className = "input-group input-group-sm";
    } else if (667 <= windowWidth && windowWidth <= 1193) {
      resizebox.className = "input-group";
    } else if (windowWidth >= 1194) {
      resizebox.className = "input-group input-group-lg";
    }
  
  const resizeCustomselectbox1 = document.getElementById("customselectbox1");
    if (windowWidth <= 666) {
      resizeCustomselectbox1.className = "custom-select text-charcoal";
    } else if (windowWidth >= 667) {
      resizeCustomselectbox1.className = "custom-select custom-select-lg text-charcoal";
    } 
  const resizeCustomselectbox2 = document.getElementById("customselectbox2");
    if (windowWidth <= 666) {
      resizeCustomselectbox2.className = "custom-select text-charcoal";
    } else if (windowWidth >= 667) {
      resizeCustomselectbox2.className = "custom-select custom-select-lg text-charcoal";
    } 
  const resizeCustomselectbox3 = document.getElementById("customselectbox3");
    if (windowWidth <= 666) {
      resizeCustomselectbox3.className = "custom-select text-charcoal";
    } else if (windowWidth >= 667) {
      resizeCustomselectbox3.className = "custom-select custom-select-lg text-charcoal";
    } 
  const resizeCustomselectbox4 = document.getElementById("customselectbox4");
    if (windowWidth <= 666) {
      resizeCustomselectbox4.className = "custom-select text-charcoal";
    } else if (windowWidth >= 667) {
      resizeCustomselectbox4.className = "custom-select custom-select-lg text-charcoal";
    } 
  const resizeCustomselectbox5 = document.getElementById("customselectbox5");
    if (windowWidth <= 666) {
      resizeCustomselectbox5.className = "custom-select text-charcoal";
    } else if (windowWidth >= 667) {
      resizeCustomselectbox5.className = "custom-select custom-select-lg text-charcoal";
    } 
}

//デバイスの向きをalert表示  
//var orient = window.onorientation;
//  if(Math.abs(window.orientation) === 0){
//    alert("横向き");
//  } else {
//    alert("縦向き");
//  } 

//傾きを変える度に現在の傾きを判定
window.orientationchange = function (){
  if (Math.abs(window.orientation) === 0){
    window.reload(); 
  } else {
    window.reload();
  }
};

function categorySet(){
  var value = document.getElementById("customselectbox1").value;
  var subcateSel = document.getElementById("customselectbox2");
  if  (1 <= value && value <= 4){
    document.getElementById("customselectbox2").style.display = "block";
    
    var subs = subcategories[value];
    var size = subcateSel.options.length;
    
    for ( i = 0; i < size; i++){
      subcateSel.remove( 0 );
    }
  
    for ( i = 0; i < subs.length; i++ ){
      var option = document.createElement( "option" );
        option.text = subs[i];
        option.value = i;
        subcateSel.add( option );
    }
  } else {
    document.getElementById("customselectbox2").style.display = "none";
  }

  subcateSel.selectedIndex = 0;
}
