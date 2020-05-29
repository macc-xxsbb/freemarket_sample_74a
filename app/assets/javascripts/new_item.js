  // 関数の定義
$(document).on('turbolinks:load', function(){
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  const buildFileField = (index) => {
    const html = `<input type="file" 
                  name="item[item_images_attributes][${index}][image]" 
                  value style="display:none" id="_item_item_images_attributes_${index}_id" class="js-file">`;
    return html;
  }
  var labels = (index) => {
    var html2 = `<div id="image-box__container__var">
                   <label for="_item_item_images_attributes_${index}_id">
                     <i class="fas fa-camera"></i>
                   </label>
                 </div>`;
    return html2;
  }
  var labels2 = (index) => {
    var html2 = `<div id="image-box__square__var">
                   <label for="_item_item_images_attributes_${index}_id">
                     <i class="fas fa-camera"></i>
                   </label>
                 </div>`;
    return html2;
  }
  const buildImage = (name, src, index) => {
    const html3 = `<div class='item-image' data-image="${name}">
                    <div class='item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete${index}'>削除</div>
                    </div>
                  </div>`;
    return html3;
  }
  const buildImg = (index, url)=> {
    const html = `<div class='item-image__operetion'>
                    <img data-index="${index}" src="${url}" width="114px" height="80px">                  
                    <div class='item-image__operetion--delete${index}'>削除</div>
                  </div>`;
    return html;
  }


  // 出品機能
  $('#image-box__container').on('change', '.js-file', function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file) {
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i

      $('#image-box__container__var').remove();
      $('#image-box__container').append(labels(num));
      $('#image-box__container').append(buildFileField(num));  

      fileReader.readAsDataURL(file);
      if (num == 10){
        $('.name__image__set').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        $('.name__image__set').before(buildImage(file.name, src, num));
      };
      $(document).on("click", '.item-image__operetion--delete' + num, function(){
        var target_image = $(this).parent().parent();
        target_image.remove();
        var target_file = $('#_item_item_images_attributes_' + (num - 1) + '_id');
        target_file.remove();
      })
    });
  });


  // 編集機能
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  console.log(lastIndex)
  fileIndex.splice(0, lastIndex);
  console.log(fileIndex)

  $('.hidden-destroy').hide();

  $('#image-box__square').on('change', '.js-file', function(e) {
    const targetIndex = fileIndex[0] - 1;
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__square').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      console.log(fileIndex)
      $('#image-box__square__var').remove();
      $('#image-box__square').append(labels2(fileIndex[0] - 1));
      $(document).on("click", '.item-image__operetion--delete' + targetIndex, function(){
        var target_image = $(this).parent().parent();
        target_image.remove();
        var target_file = $('#_item_item_images_attributes_' + targetIndex + '_id');
        target_file.remove();
      })
    }
  });

  $('#image-box__square').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    if (hiddenCheck) $(`img[data-index="${targetIndex}"]`).remove();
    if (hiddenCheck) $(`'#_item_item_images_attributes_${targetIndex}_image'`).remove();

    if ($('.js-file').length == 0) $('#image-box__square').append(buildFileField(fileIndex[0]));
  });
});
