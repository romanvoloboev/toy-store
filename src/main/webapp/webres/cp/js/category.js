$(function() {
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("#previews", {
        acceptedFiles: "image/jpeg",
        url: '/ggg',
        maxFiles: 1,
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

