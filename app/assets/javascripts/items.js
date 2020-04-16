  $(function(){
  const buildFileField = (index)=> {
    const html = `<div class="newImageBox"><div data-index="${index}" class="newImageBoxGroup">
                    <input class="newImageBoxGroupForm" type="file"
                    name="item[images_attributes][${index}][src]"
                    id="item_images_attributes_${index}_src"><br>
                    <div class="newImageBoxGroupRemove">削除</div>
                  </div></div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.newImageBoxGroup:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('#image-box').on('change', '.newImageBoxGroupForm', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#imagePre').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
  $('#image-box').on('click', '.newImageBoxGroupRemove', function() {
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.newImageBoxGroupForm').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
