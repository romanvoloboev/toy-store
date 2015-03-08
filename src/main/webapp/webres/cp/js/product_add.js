$(function() {
    image_row = 1;

    $('#input-description').summernote({
        height: 250,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']]
        ]
    });

    //$('input[name=\'category\']').autocomplete({
    //    'source': function(request, response) {
    //        $.ajax({
    //            url: '' +  encodeURIComponent(request),
    //            dataType: 'json',
    //            success: function(json) {
    //                response($.map(json, function(item) {
    //                    return {
    //                        label: item['name'],
    //                        value: item['category_id']
    //                    }
    //                }));
    //            }
    //        });
    //    },
    //    'select': function(item) {
    //        $('input[name=\'category\']').val('');
    //
    //        $('#product-category' + item['value']).remove();
    //
    //        $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
    //    }
    //});


    //todo - send post request and get count of uploaded images for current product
    // https://github.com/blueimp/jQuery-File-Upload/wiki

    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("#previews", {
        acceptedFiles: "image/jpeg",
        url: '/ggg',
        maxFiles: 5,
        maxFilesize: 3,
        addRemoveLinks: true,
        autoProcessQueue: false,
        clickable: "#select-image",
        previewsContainer: "#previews",
        dictRemoveFile: "Удалить файл",
        dictFileTooBig: "Размер файла превышен!",
        dictInvalidFileType: "Файл данного типа не поддерживается",
        dictMaxFilesExceeded: "Лимит файлов для загрузки исчерпан!",
        dictDefaultMessage: "Выберите файлы для загрузки",
        dictCancelUpload: "Отменить загрузку",

        reset: function() {
            $('.image-previews').hide();
        },

        error: function(file, response) {
          alert(response);
        },

        maxfilesexceeded: function(file)
        {
            alert('You have uploaded more than 1 Image. Only the first file will be uploaded!');
        },
        success: function (response) {
        }
    });

    $('#save-product').click(function(e){
        e.preventDefault();
        e.stopPropagation();
        myDropzone.processQueue();
    });

    $('#select-image').click(function (){
        $('.image-previews').show();
    });
});

function appendImage() {
        html  = '<tr id="image-row' + image_row + '">';
        html += '  <td class="text-center"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="http://demo.opencart.com/image/cache/no_image-100x100.png"/></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#images tbody').append(html);

        image_row++;
}