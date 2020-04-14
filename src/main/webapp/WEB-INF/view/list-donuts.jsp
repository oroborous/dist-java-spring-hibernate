<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Donut Reviews</title>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
</head>
<body>

<%@include file="/WEB-INF/view/includes/header.jsp" %>

<div id="container">

    <div id="content">

        <!-- add donut button -->
        <button class="add-button"
                onclick="window.location.href='${cp}/donut/user/showAddDonutForm'; return false;">Add Donut
        </button>

        <!-- search form -->
        <form:form action="search" method="GET">
            Search donuts <input type="search" name="searchTerm"/>
            <input type="submit" value="Search" class="add-button"/>
        </form:form>

        <!-- donut list table -->

        <table>
            <tr>
                <th></th>
                <th>Shop</th>
                <th>Name</th>
                <th>Calories</th>
                <th>Date Added</th>
                <th>Action</th>
            </tr>
            <c:forEach var="tempDonut" items="${donuts}">

                <!-- construct an "update" link with donut id -->
                <!-- c:url is same as JSP's response.encodeURL() -->
                <c:url var="updateLink" value="/donut/showUpdateDonutForm">
                    <c:param name="donutId" value="${tempDonut.id}"/>
                </c:url>

                <!-- construct a "delete" link with donut id -->
                <c:url var="deleteLink" value="/donut/delete">
                    <c:param name="donutId" value="${tempDonut.id}"/>
                </c:url>

                <!-- construct a URL to retrieve the image by id -->
                <c:url var="imageLink" value="/image/display">
                    <c:param name="id" value="${tempDonut.imageId}"/>
                </c:url>

                <tr>
                    <td>
                        <img src="${imageLink}" alt="${tempDonut.name}">
                    </td>
                    <td>${tempDonut.shop.name}</td>
                    <td>${tempDonut.name}</td>
                    <td>${tempDonut.calories}</td>
                    <td>${tempDonut.formattedDate}</td>
                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}">Update</a>
                        |
                        <!-- display the delete link -->
                        <a href="${deleteLink}"
                           onclick="if (!confirm('Are you sure?')) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>

</div>

</body>
</html>
