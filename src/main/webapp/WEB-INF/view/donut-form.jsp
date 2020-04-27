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
        <form:form action="${cp}/donut/user/save" modelAttribute="aDonut" enctype="multipart/form-data"
                   method="post">
            <form:hidden path="id" value="${aDonut.id}"/>
            <form:hidden path="imageId" value="${aDonut.imageId}"/>
            <form:hidden path="dateAdded" value="${aDonut.dateAdded}"/>

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
                        <c:if test="${aDonut.imageId != null}">
                            <br/><br/>
                            <img src="${cp}/image/display?id=${aDonut.imageId}" alt="${aDonut.name}">
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
