<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="wrapper">
    <div id="header">
        <h2>Donut Reviews</h2>

        <!-- If the user is not logged in, display a login link -->
        <!-- If the user is logged in, display their username and a logout link -->
        <c:choose>

            <c:when test="${pageContext.request.userPrincipal != null}">
                Hello <strong>${pageContext.request.userPrincipal.name}</strong>
                &nbsp;|&nbsp;
                <a href="${cp}/logout">Logout</a>
            </c:when>

            <c:otherwise>
                <a href="${cp}/showLoginForm">Login</a>
            </c:otherwise>

        </c:choose>

    </div>
</div>
