$(function (){
  //画像用inputを生成する関数
  const buildFileField = (index)=> {
    const html = `<input accept="image/*" class="js-file" data-index="${index}" style="display: none;", type="file" name="item[images_attributes][${index}][url]" id="images_attributes_${index}_url">`;
    return html;
  }
  //プレビュー用imageタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}>" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
   let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#imageInput').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // labelタグのfor属性を変更
    $('#imageInput__label').attr('for', 'images_attributes_' + fileIndex[0] + '_url');
    // ファイルのブラウザ上でのURLを習得
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    //$('#imageInput').append(buildImg(targetIndex, blobUrl));
    $('#imageInput').before(buildImg(targetIndex,blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('#imageInput').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    //末尾の数に1足した数を追加
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

  });
});