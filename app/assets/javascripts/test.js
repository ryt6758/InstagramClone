let Test = function () { };

Test.prototype._boxId = "js-box";

Test.prototype.widthTransform = function () {
  let self = this;
  //要素を取得
  let currentTransformDOM = document.getElementById(self._boxId);
  let currentTransformStyle = currentTransformDOM.style;

  let isOpened = currentTransformDOM.dataset.isOpened;
  console.log(isOpened);
  if (isOpened === "true") {
    currentTransformStyle.width = "300px";
    currentTransformDOM.dataset.isOpened = false;
  } else {
    //widthプロパティを変更
    currentTransformStyle.width = "100%";
    currentTransformDOM.dataset.isOpened = true;
  }
};

Test.prototype.init = function () {
  let self = this;
  document.getElementById(self._boxId).addEventListener('click', function () {
    self.widthTransform();
  });
};


window.addEventListener('DOMContentLoaded', function () {
  let test = new Test();
  test.init();
});
