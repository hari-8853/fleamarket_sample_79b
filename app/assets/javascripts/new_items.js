 $(function (){
     //画像用inputを生成する関数
     const buildFileField = (index)=> {
       const html = `<div data-index="${index}" class="js-file_group">
                     <input accept="image/*" class="js-file" 
                     data-index="${index}"
                     style="display: none;",
                     type="file" 
                     name="item[images_attributes][${index}][url]"
                     id="item_images_attributes_${index}url"></div>`;
       return html;
     }
     //プレビュー用imageタグを生成する関数
     const buildImg = (index, url)=> {
       const html = `<img data-index="${index}>" src="${url}" width="100px" height="100px">
                     <div class="js-remove" id="js-remove${index}">削除する</div>`;
       return html;
     }
   
     // file_fieldのnameに動的なindexをつける為の配列
      let fileIndex = [1,2,3,4,5,6,7,8,9,10];
      
  
     // 既に使われているindexを除外。これにより、数字のつじつまが合うようになる。
       lastIndex = $('.js-file:last').data('index');
       fileIndex.splice(0, lastIndex);
       $('.hidden-destroy').hide();


      //カメラボタンがクリックされた時に発火するメソッド
    $('#image-Input__label').on("click",function() { 
      // インプットタグの「最後」を取得する
      const file_field = $('.js-file:last');
      console.log(file_field)
      // 取得したインプットタグをクリックするメソッド
      file_field.trigger("click");
    })

     $('#imageInput').on('change', '.js-file', function(e) {
       // ファイルが選択されたときfileIndexの最初の数字をindexとして持ったフォームを新しく作成する。
       const targetIndex = $(this).parent().data("index");

       // labelタグのfor属性を変更
       $('#image-Input__label').attr('for', `images_attributes_${fileIndex[0]}_url`);
       
       // ファイルのブラウザ上でのURLを習得
       const file = e.target.files[0];
       const blobUrl = window.URL.createObjectURL(file);
  
      // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
      
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
       img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        const new_image = buildImg(targetIndex, blobUrl)
        const new_image_wrapper = `<div class="new_image_wrapper">${new_image}</div>`;
        
       $('#preview').append(new_image_wrapper);
       
      
       // fileIndexの先頭の数字を使ってinputを作る
      //  $('.image_box#mini:last').append(buildFileField(fileIndex[0]));
       $('#imageInput').append(buildFileField(fileIndex[0]));
       fileIndex.shift();
      
       // 末尾の数に1足した数を追加する
       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
     }
   });
  
     $('.image_box').on('click', '.js-remove', function() {
       const targetIndex = $(this).parent().data('index');
       console.log(targetIndex);
       console.log("ok");
       // 該当indexを振られているチェックボックスを取得する
       const hiddenCheck = $(`#item_images_attributes_${targetIndex}__destroy`);
       console.log(hiddenCheck);

       // もしチェックボックスが存在すればチェックを入れる
       $(`#item_images_attributes_${targetIndex}__destroy`).prop("checked", true);

       //  ここで削除が実行されるが、いろんなところに干渉している気がする
         $(this).parent().remove();
        
         // この辺りに、ファイルを選択も消す動作を入れたい
         $(`#item_images_attributes_${targetIndex}_url`).remove();
  
         // 画像入力欄が0個にならないようにしておく
         if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
       });
     });
  