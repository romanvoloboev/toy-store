var myDropzone;
var selectedCategoryId = 0;
var selectedSubCategoryId = 0;
var uploadedImageId = 0;
var name = "";

function setSelectLocalData(categoryId, subcategoryId, imageId) {
    selectedCategoryId = categoryId;
    selectedSubCategoryId = subcategoryId;
    uploadedImageId = imageId;
}

function removeImage(id) {
    $('#thumb-image'+id).remove();
    $("#add-img-block").show();
}

function saveSubcategory(subcategoryId, name, categoryId, imageId) {
    console.log(subcategoryId, name, categoryId, imageId);
    if (name != "" && categoryId != 0 && imageId != 0) {
        $.post("/cp/subcategory/save", {subcategory:subcategoryId, name:name, category:categoryId, image:imageId}, function(response) {
            if(response.status == 'ok') {
                $.notify("<b>Вы успешно сохранили подкатегорию</b>",
                    {
                        type: "success",
                        delay: 1000,
                        onClose: function(){
                            history.back();
                        }
                    });
            } else if (response.status == 'wrongParams') {
                $.notify("<b>Ошибка! Проверьте правильность введеных данных</b>",
                    {
                        type: "danger",
                        delay: 1500,
                        onClose: function(){
                            $.post("/cp/delete_image", {id:imageId});
                            myDropzone.removeAllFiles();
                        }
                    });
            } else {
                $.notify("<b>Не удалось сохранить подкатегорию, повторите попытку позже</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            }
        });
    } else {
        $.notify("<b>Ошибка! Вы заполнили не все данные</b>",
            {
                type: "danger",
                delay: 1500,
                onClose: function(){
                    if($(".image-previews").css("display") != "none") {
                        $.post("/cp/delete_image", {id:imageId});
                        myDropzone.removeAllFiles();
                    }
                }
            });
    }

}
$(function() {
    var $parentCategorySelect = $("#parent-category");

    $('#save-subcategory').click(function(e){
        if($(".image-previews").css("display") != "none") {
            myDropzone.processQueue();
        } else {
            name = $("#subcategory-name").val();
            saveSubcategory(selectedSubCategoryId, name, selectedCategoryId, uploadedImageId);
        }
    });

    $('#select-image').click(function (){
        $('.image-previews').show();
    });

    $parentCategorySelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/category/load_by?active=true",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    name: params.term,
                    page: params.page
                };
            },
            processResults: function (data, page) {
                var select2Data = $.map(data.suggestions, function (obj) {
                    obj.text = obj.name;
                    return obj;
                });
                return {
                    results: select2Data,
                    pagination: {
                        more: data.more
                    }
                };
            },
            cache: true
        },
        transport: function (params, success, failure) {
            var $request = $.ajax(params);
            $request.then(success);
            $request.fail(failure);
            return $request;
        }
    });

    $parentCategorySelect.on("select2:select", function (e) {
        selectedCategoryId = $(this).val();
    });

    Dropzone.autoDiscover = false;
    myDropzone = new Dropzone("#previews", {
        acceptedFiles: "image/jpeg,image/png",
        url: "/cp/upload_image",
        maxFiles: 1,
        maxFilesize: 1,
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

        init: function() {
            this.on("addedfile", function() {
                if (this.files[1]!=null){
                    this.removeFile(this.files[0]);
                }
            });
        },

        reset: function() {
            $('.image-previews').hide();
        },

        error: function(file, response) {
            $.notify("<b>"+response+"</b>",
                {
                    type: "danger",
                    delay: 1000,
                    onClose: function(){
                        myDropzone.removeAllFiles();
                    }
                });

        },
        success: function(file, response) {
            if (response.status == "ok") {
                uploadedImageId = response.image;
                name = $("#subcategory-name").val();
                saveSubcategory(selectedSubCategoryId, name, selectedCategoryId, uploadedImageId);
            }
        }
    });
});
