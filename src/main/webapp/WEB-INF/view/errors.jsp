<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Donut Reviews - Oops!</title>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
</head>
<body>

<%@include file="/WEB-INF/view/includes/header.jsp"%>

<div id="container">
    <div id="content">
        <h3>Oops! An error occurred</h3>
        <p>${errorMessage}</p>
    </div>
</div>

<security:authorize access="hasRole('ADMIN')">
    <c:forEach items="${exception.stackTrace}" var="element">
        <c:out value="${element}"/>
    </c:forEach>
</security:authorize>

<%@include file="/WEB-INF/view/includes/footer.jsp"%>
</body>
</html>
