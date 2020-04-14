<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Donut Reviews - Edit Donut</title>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/donut-form-style.css">
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/select-style.css">
</head>
<body>

<%@include file="/WEB-INF/view/includes/header.jsp" %>

<div id="container">

    <div id="content">
        <form:form action="${cp}/donut/save" modelAttribute="donut" enctype="multipart/form-data"
                   method="post">
            <form:hidden path="id" value="${donut.id}"/>
            <form:hidden path="imageId" value="${donut.imageId}"/>
            <form:hidden path="dateAdded" value="${donut.dateAdded}"/>

            <table>
                <tr>
                    <td><label>Name</label></td>
                    <td><form:input path="name"/>
                        <form:errors path="name" cssClass="error"/></td>
                </tr>
                <tr>
                    <td><label>Calories</label></td>
                    <td><form:input path="calories"/>
                        <form:errors path="calories" cssClass="error"/></td>
                </tr>
                <tr>
                    <td><label>Shop</label></td>
                    <td>
                        <form:select path="shop" items="${donutShops}" itemLabel="name" itemValue="id"
                                     cssClass="select-css">
                        </form:select>
                        <form:errors path="shop" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Image</label></td>
                    <td>
                        <input type="file" name="imageFile">
                        <c:if test="${donut.imageId != null}">
                            <br/><br/>
                            <img src="${cp}/image/display?id=${donut.imageId}" alt="${donut.name}">
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save" class="save"></td>
                </tr>
            </table>
        </form:form>

        <%@include file="/WEB-INF/view/includes/footer.jsp" %>

    </div>
</div>
</body>
</html>
