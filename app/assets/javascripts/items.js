  $(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="newImageBoxGroup">
                    <input class="newImageBoxGroupForm" type="file"
                    name="item[images_attributes][${index}][src]"
                    id="item_images_attributes_${index}_src"><br>
                    <div class="newImageBoxGroupRemove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="184px" height="184px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.newImageBoxGroup:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  $('#image-box').on('change', '.newImageBoxGroupForm', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
      // console.log('dou?')
      // if ($('.newImageBoxGroupForm').length < 4) {
      //   fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      // }
      } else {  // 新規画像追加の処理
      $('#imagePre').append(buildImg(targetIndex, blobUrl));
      if ($('.newImageBoxGroupForm').length < 4) {
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      }
    }
});

  $('#image-box').on('click', '.newImageBoxGroupRemove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.newImageBoxGroupForm').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
