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

function resizeElement(){
  const windowWidth = document.documentElement.clientWidth;
  const windowHeight = document.documentElement.clientHeight;

  //要素を取得
  const resizebox = document.getElementById("resizebox");
  if (windowWidth > 576) {
    resizebox.className = "input-group input-group-lg";
    //resizebox.style.color = "#ff0000"
    //alert ("アラート");
  }
}
