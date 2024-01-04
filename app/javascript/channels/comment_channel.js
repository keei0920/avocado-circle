import consumer from "channels/consumer"

// showアクションのURI (posts/数字)になっている場合に実行する
if(location.pathname.match(/\/posts\/\d/)){

  // どのチャネルを使用するかの定義
  consumer.subscriptions.create({
    channel: "CommentChannel",

    // /\d+/は、1つ以上の数字が連続している部分（つまり、数値の部分）を抽出し、[0] を使って最初のマッチを取得
    post_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  
  // 受け取った情報を含んだhtmlを作成し、htmlという変数に代入
  received(data) {
    const html = `
    <div class="comment">
    <p class="user-info">${data.user.nickname}: </p>
    <p>${data.comment.text}</p>
    </div>`
      // ブラウザ上のcommentsというidを持った要素を取得し、コメント欄の最後尾としてコメントを追加
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      // コメント投稿フォームの要素を取得し、フォームの中身をリセット
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
  }
})
}
