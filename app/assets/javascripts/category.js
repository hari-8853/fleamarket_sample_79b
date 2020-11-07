//初回読み込み、リロード、ページ切り替えで動く
$(document).on('turbolinks:load', function(){
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    // 子カテゴリーの表示作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select class="sellCollectionSelect__label" id="children_wrapper" name="item[category_id]">
                         <option value="---" data-category="---">---</option>
                         ${insertHTML}
                         </select>
                         <i class='fas fa-chevron-down second'></i> `;
      $('#box').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchildrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<select class="sellCollectionSelect__label" id="grandchildren_wrapper" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                              </select>
                              <i class='fas fa-chevron-down third' ></i> `;
      $('#box').append(grandchildSelectHtml);
    }

    // 親カテゴリー選択後のイベント
    $('#item_category_id').on('change', function(){
      var item_category_id = document.getElementById('item_category_id').value;
      if (item_category_id != "---"){
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_id: item_category_id },
          dataType: 'json'
        })
          .done(function(children){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $('.sellCollectionSelect').on('change', '#children_wrapper', function(){
      var child_category_id = $('#children_wrapper option:selected').data('category');
      if (child_category_id != "---"){
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove();
      }
    });
  });
});