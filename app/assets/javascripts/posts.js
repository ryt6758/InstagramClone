var Posts = Posts || function () { };

(function () {
  Posts.prototype._imageId = "js-post-image";

  Posts.prototype._goodButtonId = "js-good-button";
  Posts.prototype._goodCountId = "js-good-count";
  Posts.prototype._commentFormId = "js-comment-form"

  Posts.prototype.countUp = function () {
    // // 現在のカウントを取得する
    // let self = this;
    // var currentCountDOM = document.getElementById(self._goodCountId);
    // var currentCount = parseInt(currentCountDOM.innerText);
    // console.log(currentCount);
    // // カウントを進める
    // currentCount = currentCount + 1;
    // // カウントを書き換える
    // currentCountDOM.innerText = String(currentCount);

    let postContainer = document.getElementById("js-post-container");
    let postId = postContainer.dataset.postId;
    let userId = postContainer.dataset.userId;

    $.ajax({
      url: `/posts/${postId}/likes/create`,
      type: 'POST',
      dataType: "json",
      data: {
        'user_id': userId,
        'post_id': postId,
      }
    })
      // Ajaxリクエストが成功した時発動
      .done((data) => {
        console.log("success");
        console.log(data);
        $('#js-good-count').html(data.likes_count);
        $('#js-good-button').html("unGOOD");
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

  Posts.prototype.countDown = function () {

    let postContainer = document.getElementById("js-post-container");
    let postId = postContainer.dataset.postId;
    let userId = postContainer.dataset.userId;

    $.ajax({
      url: `/posts/${postId}/likes/destroy`,
      type: 'POST',
      dataType: "json",
      data: {
        'user_id': userId,
        'post_id': postId,
      }
    })
      // Ajaxリクエストが成功した時発動
      .done((data) => {
        console.log("success");
        console.log(data);
        $('#js-good-count').html(data.likes_count);
        $('#js-good-button').html("GOOD");
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

  Posts.prototype.init = function () {
    let self = this;
    document.getElementById(self._goodButtonId).addEventListener('click', function () {
      if (this.dataset.postCountable === "true") {
        self.countUp();
        this.dataset.postCountable = false;
      } else {
        self.countDown();
        this.dataset.postCountable = true;
      }
    });

    let comment = document.getElementById(self._commentFormId);
    comment.addEventListener("ajax:success", function (e) {
      console.log(e);
      let json = e.detail[0];
      let content = json.comment
      document.getElementById("comment_content").innerHTML = "";
      let p = document.createElement("p");
      p.innerHTML = `${json.comment_content} /
      <a href="/users/${json.user_id}">${json.user_name}</a> - ${json.create_date}
      <a href="/posts/${json.comment_id}/comments/destroy" data-method="post">削除</a>`;
      document.getElementsByClassName("comments_wrap")[0].appendChild(p);
    });
  };

})();

document.addEventListener("DOMContentLoaded", function () {
  console.log("hello, world in onload");
  var posts = new Posts();
  posts.init();
})
