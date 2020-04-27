<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Login</title>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/donut-form-style.css">
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/select-style.css">
</head>
<body>

<%@include file="/WEB-INF/view/includes/header.jsp" %>

<div id="container">
    <div id="content">
        <h3>Login</h3>
        <form:form action="${cp}/authenticate" method="POST">
            <table>
                <!-- Only show this message if the user has been logged out -->
                <c:if test="${param.logout != null}">
                    <tr>
                        <td></td>
                        <td>You have been logged out</td>
                    </tr>
                </c:if>
                <tr>
                    <td><label>Username</label></td>
                    <!-- Spring expects this to have name="username" -->
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td><label>Password</label></td>
                    <!-- Spring expects this to have name="password" -->
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"></td>
                </tr>
                <!-- Only show this row if there was a login error -->
                <c:if test="${param.error != null}">
                    <tr>
                        <td></td>
                        <td class="error">Invalid login</td>
                    </tr>
                </c:if>
            </table>
        </form:form>
    </div>

    <%@ include file="/WEB-INF/view/includes/footer.jsp" %>
</div>
</body>
</html>
