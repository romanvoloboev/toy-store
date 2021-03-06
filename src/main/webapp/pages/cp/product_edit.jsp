<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script type="text/javascript">
        $(function() {
            var promotionStart = "${product.promotionStart}";
            var promotionEnd = "${product.promotionEnd}";
            var productDescr = '${product.description}';
            var brandId = "${product.brand}";
            var subCatId = "${product.subcategory}";
            var imgs = [];
            
            <c:forEach items="${product.images}" var="i">
                imgs.push(${i});
            </c:forEach>

            setLocalData(${product.id}, promotionStart, promotionEnd, productDescr, imgs, subCatId, brandId);
        });
    </script>
    <script src="../../webres/cp/js/product_add.js"></script>


    <style type="text/css">
        .dropzone {
            border: dashed 2px rgba(72, 72, 67, 0.50);
            border-radius: 5px;
            padding: 0;
        }
        .col-centered{
            float: none;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-plus"></i>&nbsp;Редактирование товара</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <button type="button" id="promotion-btn" class="btn btn-warning"><i class="fa fa-gift"></i>&nbsp;Акционный товар</button>
                    <a href="<c:url value="/cp/product"/>" class="btn btn-default"><i class="fa fa-reply"></i>&nbsp;Отмена</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7" style="padding: 0;">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" value="${product.name}" id="product-name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <select class="form-control select2" id="product-category">
                                        <option value="${product.subcategory}" selected disabled>${product.subcategoryName}</option>
                                    </select>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <select class="form-control select2" id="product-brand">
                                        <option value="${product.brand}" selected disabled>${product.brandName}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <input type="text" value="${product.code}" id="product-code" class="form-control">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" value="${product.price}" id="product-price" class="form-control">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" value="${product.quantity}" id="product-quantity" class="form-control">
                                </div>
                            </div>

                            <c:choose>
                                <c:when test="${product.material == null && (product.length == null && product.width == null && product.height == null)}">
                                    <div class="form-group text-center">
                                        <a href="" id="additional-block-show"><span style="font-size: 12px; font-weight: bold; ">Дополнительные не обязательные параметры: материал и габариты изделия</span></a>
                                    </div>
                                    <div class="form-group" id="additional-block" style="display: none">
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Материал" id="product-material" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" placeholder="Ширина (см.)" id="product-width" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" placeholder="Высота (см.)" id="product-height" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" placeholder="Толщина (см.)" id="product-length" class="form-control">
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-group text-center">
                                        <a href="" id="additional-block-show"><span style="font-size: 12px; font-weight: bold; ">Дополнительные не обязательные параметры: материал и габариты изделия</span></a>
                                    </div>
                                    <div class="form-group" id="additional-block">
                                        <div class="col-md-6">
                                            <input type="text" value="${product.material}" placeholder="Материал" id="product-material" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" value="${product.width}" placeholder="Ширина (см.)" id="product-width" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" value="${product.height}" placeholder="Высота (см.)" id="product-height" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="text" value="${product.length}" placeholder="Толщинаа (см.)" id="product-length" class="form-control">
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${product.promotion}">
                                    <div class="form-group" id="promotion-block">
                                        <div class="col-md-4">
                                            <label class="control-label">Начало акции</label>
                                            <div class="input-group date" id="datetimepickerStart">
                                                <input type="text" class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Конец акции</label>
                                            <div class="input-group date" id="datetimepickerEnd">
                                                <input type="text" class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Акционная цена</label>
                                            <input type="text" value="${product.promotionPrice}" id="product-promotion-price" class="form-control">
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-group" id="promotion-block" style="display: none;">
                                        <div class="col-md-4">
                                            <label class="control-label">Начало акции</label>
                                            <div class="input-group date" id="datetimepickerStart">
                                                <input type="text" class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Конец акции</label>
                                            <div class="input-group date" id="datetimepickerEnd">
                                                <input type="text" class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Акционная цена</label>
                                            <input type="text" id="product-promotion-price" class="form-control">
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <textarea placeholder="Описание товара" id="product-description" style="display: none;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                    <c:choose>
                                        <c:when test="${product.images != null}">
                                            <div class="text-center" style="padding-bottom: 10px;">
                                                <span style="color: #e2af00;">Изображения товара</span>
                                            </div>
                                            <c:forEach items="${product.images}" var="i">
                                                <div class="col-sm-2 col-md-2" id="thumb-image${i}">
                                                    <div class="panel panel-default" style="margin-bottom: 0">
                                                        <div class="panel-image">
                                                            <img src="<c:url value="/image/load?id=${i}"/>" class="panel-image-preview" style="height: 90px;" />
                                                        </div>
                                                        <div class="panel-footer text-center">
                                                            <button onclick="removeImage(${i});" class="btn">
                                                                <span class="fa fa-times"></span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                <div class="col-sm-12 col-md-12 col-lg-12" id="add-img-block" >
                                    <div class="text-center" style="padding-bottom: 10px;">
                                        <span style="color: #a6a6a6;">Вы должны загрузить до 5 изображений, при этом размер каждого не должен превышать 2Мб.</span>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" id="select-image" class="btn btn-warning"><i class="fa fa-folder-open"></i> Выбрать</button>
                                    </div>
                                    <div class="image-previews col-md-12 text-center" style="display: none; padding-top: 10px; padding-left: 0; padding-right: 0;">
                                        <div id="previews" class="dropzone"></div>
                                    </div>
                                </div>


                            </div>
                            <div class="form-group text-center">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <button type="button" id="save-product" class="btn btn-success"><i class="fa fa-check"></i> Сохранить</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
</body>
</html>