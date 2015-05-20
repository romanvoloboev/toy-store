var product = 0;
var subcategory = 0;
var brand = 0;
var images = [];
var deletedImages = [];
var promoStart = "";
var promoEnd = "";
var productDescription;

function setLocalData(productId, startDate, endDate, descr, imgs, subCatId, brandId) {

    product = productId;
    $("#datetimepickerStart").datetimepicker({
        date: new Date(startDate)
    });
    $("#datetimepickerEnd").datetimepicker({
        date: new Date(endDate)
    });
    productDescription = descr;
    images = imgs;
    subcategory = subCatId;
    brand = brandId;

}
function removeImage(id) {
    $('#thumb-image'+id).remove();
    var imgPos = $.inArray(id, images);
    if ( imgPos != -1 ) images.splice(imgPos, 1);
    deletedImages.push(id);
    if (images.length == 0) {
        $("#add-img-block").show();
    }
}

function saveProduct() {
    var name = $("#product-name").val();
    var code = $("#product-code").val();
    var price = $("#product-price").val();
    var quantity = $("#product-quantity").val();
    var description = $("#product-description").code();


    if (name != "" && subcategory != 0 && brand != 0 && code != "" && price != "" && quantity != "" && description != "" && (images.length > 0)) {

        var data = {id:product, name:name, subcategory:subcategory, brand:brand, code:code, price:price, quantity:quantity,
            description:description, images:images};

        if ($("#promotion-block").css("display") != "none") {
            var promoPrice = $("#product-promotion-price").val();
            if (promoStart != "" && promoEnd != "" && promoPrice != "") {
                data.promotionPrice = promoPrice;
                data.promotionStart = promoStart;
                data.promotionEnd = promoEnd;
            }
        }

        if ($("#additional-block").css("display") != "none") {
            var material = $("#product-material").val();
            var length = $("#product-length").val();
            var width = $("#product-width").val();
            var height = $("#product-height").val();
            if (material != "") {
                data.material = material;
            }
            if (length != '' && width != '' && height != '') {
                data.length = length;
                data.width = width;
                data.height = height;
            }
        }

        $.ajax({
            url: "/cp/product/save",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(data),

            success: function(response) {
                if(response.status == 'ok') {
                    deleteOldImages(deletedImages);
                    $.notify("<b>Вы успешно сохранили товар</b>",
                        {
                            type: "success",
                            delay: 1000,
                            onClose: function(){
                                history.back();
                            }
                        });
                } else if (response.status == 'wrongParams') {
                    $.notify("<b>Ошибка! Введенные данные не соответствуют требуемому формату</b>",
                        {
                            type: "danger",
                            delay: 1500
                        });
                    deleteImages();
                }
            },
            error: function(xhr, status, error) {
                $.notify("<b>Не удалось сохранить товар. Что-то пошло не так...</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
                deleteImages();
            }
        })

    } else {
        $.notify("<b>Ошибка! Вы заполнили не все поля</b>",
            {
                type: "danger",
                delay: 1000
            });
        deleteImages();
    }
}

function deleteOldImages(deletedImages) {
    if (deletedImages.length > 0) {
        deletedImages.forEach(function(item, i, arr) {
            $.post("/cp/delete_image", {id:item});
        });
    }
}

function deleteImages() {
    if (images.length > 0) {
        images.forEach(function(item, i, arr) {
            $.post("/cp/delete_image", {id:item});
        });
        images = [];
        myDropzone.removeAllFiles();
    }
}

$(function() {
    var $productSubcategorySelect = $("#product-category");
    var $productBrandSelect = $("#product-brand");
    var $dateStart = $("#datetimepickerStart");
    var $dateEnd = $("#datetimepickerEnd");


    $dateStart.datetimepicker({
        format: 'DD/MM/YYYY'
    });

    $dateEnd.datetimepicker({
        format: 'DD/MM/YYYY'
    });

     $('#product-description').summernote({
        height: 175,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']]
        ]
    });

    if (productDescription != '') {
        $('#product-description').code(productDescription);
    }

    $dateStart.on("dp.change", function(){
        promoStart = $("#datetimepickerStart").data('date');
    });

    $dateEnd.on("dp.change", function(){
        promoEnd = $("#datetimepickerEnd").data('date');
    });

    $productSubcategorySelect.on("select2:select", function (e) {
        subcategory = $(this).val();
    });

    $productBrandSelect.on("select2:select", function (e) {
        brand = $(this).val();
    });

    $productSubcategorySelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/subcategory/load_by?active=true",
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

    $productBrandSelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/brand/load_by?active=true",
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

    $('#promotion-btn').click(function(e){
        $("#promotion-block").show();
    });

    $('#additional-block-show').click(function(e){
        e.preventDefault();
        $("#additional-block").show();
    });


    Dropzone.autoDiscover = false;
    myDropzone = new Dropzone("#previews", {
        acceptedFiles: "image/jpeg,image/png",
        url: "/cp/upload_image",
        maxFiles: 5,
        parallelUploads: 5,
        maxFilesize: 2,
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
            $.notify("<b>"+response+"</b>",
                {
                    type: "danger",
                    delay: 1000,
                    onClose: function(){
                        myDropzone.removeAllFiles();
                    }
                });
        },
        queuecomplete: function() {
            saveProduct();
        },

        success: function(file, response) {
            if (response.status == "ok") {
                images.push(response.image);
            }
        }
    });

    $('#save-product').click(function(e) {
        if(images.length == 5) {
            $.notify("<b>Ошибка! Вы не можете загрузить больше 5 изображений</b>",
                {
                    type: "danger",
                    delay: 1000
                });
            myDropzone.removeAllFiles();
            return;
        }

        if (images.length >= 0 && myDropzone.files.length > 0) {
            myDropzone.processQueue();
            return;
        }

        if ( (($(".image-previews").css("display") != "none") && (myDropzone.files.length == 0)) || ((myDropzone.files.length == 0) && (images.length == 0)) ) {
            $.notify("<b>Ошибка! Вы должны выбрать хотя бы 1 изображение</b>",
                {
                    type: "danger",
                    delay: 1000
                });
            return;
        }

        if (myDropzone.files.length == 0 && images.length > 0 && images.length <= 5) {
            saveProduct();
        }
    });

    $('#select-image').click(function (){
        $('.image-previews').show();
    });
});
