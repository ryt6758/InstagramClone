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

  let postContainer = document.getElementById("js-post-container");
  let postId = postContainer.dataset.postId;
  let userId = postContainer.dataset.userId;

  $.ajax({
    url: `/posts/${postId}/likes/create.json`,
    type: 'POST',
    dataType: "json",
    data: {
      'user_id': userId,
    }
  })
    // Ajaxリクエストが成功した時発動
    .done((data) => {
      console.log("success");
      console.log(data);
    })
    // Ajaxリクエストが失敗した時発動
    .fail((data) => {
      console.log("error");
      console.log(data);
    })
    // Ajaxリクエストが成功・失敗どちらでも発動
    .always((data) => {

    });
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
    if (this.dataset.postCountable === "true") {
      self.countUp();
      this.dataset.postCountable = false;
    } else {
      this.dataset.postCountable = true;
    }
  });
};

// });

window.onload = function () {
  console.log("hello, world in onload");
  var posts = new Posts();
  posts.init();
}
