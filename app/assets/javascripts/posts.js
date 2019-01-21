var Posts = Posts || function () { };

// (function () {
Posts.prototype._imageId = "js-post-image";

Posts.prototype._goodButtonId = "js-good-button";
Posts.prototype._goodCountId = "js-good-count";

Posts.prototype.countUp = function () {
  // 現在のカウントを取得する
  let self = this;
  var currentCountDOM = document.getElementById(self._goodCountId);
  var currentCount = parseInt(currentCountDOM.innerText);
  console.log(currentCount);
  // カウントを進める
  currentCount = currentCount + 1;
  // カウントを書き換える
  currentCountDOM.innerText = String(currentCount);
}

Posts.prototype.showProperties = function () {
  console.log("showProperties");
};

Posts.prototype.init = function () {
  let self = this;
  document.getElementById(self._imageId).addEventListener('click', function () {
    console.log("onClick");
    self.showProperties();
  });
  document.getElementById(self._goodButtonId).addEventListener('click', function () {
    console.log("good");
    self.countUp();
  });
};

// });

window.onload = function () {
  console.log("hello, world in onload");
  var posts = new Posts();
  posts.init();
}
