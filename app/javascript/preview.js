document.addEventListener('turbo:load', function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_post');

  const previewList = document.getElementById('previews');
  
  // 新規投稿・編集ページのフォームがないならここで終了
  if (!postForm) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="post[image]"]')

  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    // 古いプレビューが存在する場合は削除する
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    // 選択した画像ファイルを発火したイベントeの中のtargetの中のfilesという配列に格納する
    const file = e.target.files[0];
    // URLの生成
    const blob = window.URL.createObjectURL(file);
    
    // 画像を表示するためのdiv要素とclassを生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewImage.classList.add('preview-size'); 

    // 生成したHTMLの要素をブラウザに表示させる
    // appendChild()メソッドは、指定した親要素の中に要素を追加するメソッド
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});