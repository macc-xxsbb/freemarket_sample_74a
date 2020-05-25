$(function(){ 
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  const buildFileField = (index) => {
    const html = `<input type="file" 
                  name="item[item_images_attributes][${index}][image]" 
                  value style="display:none" id="img-file${index}" class="js-file">`;
    return html;
  }
  var labels = (index) => {
    var html2 = `<div id="image-box__container__var">
                   <label for="img-file${index}">
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
        var target_file = $('#img-file' + (num - 1));
        target_file.remove();
      })
    });
  });
});

