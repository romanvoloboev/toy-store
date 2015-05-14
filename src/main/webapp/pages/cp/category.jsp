<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/category_edit.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/category/add"/>" data-toggle="tooltip" class="btn btn-success" data-original-title="Добавить категорию"><i class="fa fa-plus"></i>&nbsp;Добавить категорию</a>
                    <a href="<c:url value="/cp/subcategory/add"/>" data-toggle="tooltip" class="btn btn-success" data-original-title="Добавить подкатегорию"><i class="fa fa-plus"></i>&nbsp;Добавить подкатегорию</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal col-sm-12 col-md-8 col-lg-8" style="padding: 0;">
                        <div class="table-responsive ">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-left col-sm-6 col-md-8 col-lg-8">Название</th>
                                    <th class="text-center col-sm-6 col-md-4 col-lg-4">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${category}" var="c">
                                    <tr>
                                        <td class="text-left">${c.name}</td>
                                        <td class="text-center">
                                            <button type="button" onclick="changeCategoryStatus(${c.id})" data-toggle="tooltip" class="btn <c:out value="${c.active ? 'btn-default' : 'btn-warning'}"/>"
                                                    data-original-title="<c:out value="${c.active ? 'Скрыть категорию' : 'Активировать категорию'}"/>">
                                                <span class="fa <c:out value="${c.active ? 'fa-eye' : 'fa-eye-slash'}"/>"></span>
                                            </button>
                                            <a href="<c:url value="/cp/category/edit?id=${c.id}"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Редактировать категорию"><i class="fa fa-pencil"></i></a>
                                            <button type="button" onclick="deleteCategory(${c.id})" data-toggle="tooltip" class="btn btn-danger" data-original-title="Удалить категорию">
                                                <span class="fa fa-trash"></span>
                                            </button>
                                        </td>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${not empty c.subcategories}">
                                            <c:forEach items="${c.subcategories}" var="s">
                                                <tr>
                                                    <td class="text-left">&emsp;&emsp;${s.name}</td>
                                                    <td class="text-center">
                                                        <button type="button" onclick="changeSubCategoryStatus(${s.id})" data-toggle="tooltip" class="btn <c:out value="${s.active ? 'btn-default' : 'btn-warning'}"/>"
                                                                data-original-title="<c:out value="${s.active ? 'Скрыть подкатегорию' : 'Активировать подкатегорию'}"/>">
                                                            <span class="fa <c:out value="${s.active ? 'fa-eye' : 'fa-eye-slash'}"/>"></span>
                                                        </button>
                                                        <a href="<c:url value="/cp/subcategory/edit?id=${s.id}"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Редактировать подкатегорию"><i class="fa fa-pencil"></i></a>
                                                        <button type="button" onclick="deleteSubCategory(${s.id})" data-toggle="tooltip" class="btn btn-danger" data-original-title="Удалить подкатегорию">
                                                            <span class="fa fa-trash"></span>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>