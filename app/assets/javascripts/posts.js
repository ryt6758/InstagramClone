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

  Posts.prototype.createComment = function (json) {
    let self = this;
    let p = document.createElement("p");
    document.getElementById("comment_content").value = "";
    p.innerHTML = `${json.comment_content} /
      <a href="/users/${json.user_id}">${json.user_name}</a> - ${json.create_date}
      <span data-method="post" data-comment-id="${json.comment_id}">削除</span>`;
    let deleteDOMs = p.querySelectorAll("[data-comment-id]");
    for (let i = 0; i < deleteDOMs.length; i++) {
      deleteDOMs[i].addEventListener("click", function () {
        self.deleteComment(this);
        this.parentNode.remove();
      });
    };
    // p.querySelector("[data-comment-id]").onclick = function () {
    //   self.deleteComment(this);
    //   this.parentNode.remove();
    //   console.log(self.deleteComment);
    // };
    document.getElementsByClassName("comments_wrap")[0].appendChild(p);
  }

  Posts.prototype.deleteComment = function (deleteDOM) {
    let commentId = deleteDOM.dataset.commentId;
    $.ajax({
      url: `/posts/${commentId}/comments/destroy`,
      type: "POST",
      dataType: "json",
      data: {
        "comment_id": commentId
      }
    })
      .done((data) => {
        console.log(data);
      })
      .fail((data) => {
        console.log("error");
        console.log(data);
      })
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

    document.getElementById(self._commentFormId).addEventListener("ajax:success", function (e) {
      let json = e.detail[0];
      self.createComment(json);
    });
  };

})();

document.addEventListener("DOMContentLoaded", function () {
  console.log("hello, world in onload");
  var posts = new Posts();
  posts.init();
})
