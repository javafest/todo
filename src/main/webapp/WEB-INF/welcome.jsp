<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  User: erfan
  Date: 4/14/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>
        Welcome
    </title>
</head>
<body>

<div class="container">
    <div class="row" style="padding-top: 20%">

        <div class="col-md-4"></div>

        <div class="col-md-4">
            <div class="mb-3">
                <legend>Welcome <strong>${pageContext.request.userPrincipal.name}</strong></legend>
            </div>

            <div class="mb-3">
                <a href="/task/show">Go to task list</a>
            </div>

<%--            logout mechanism of spring security--%>
            <div class="mb-3">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout" class="form-signin">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <button class="btn btn-sm btn-danger"
                                style="margin-top: 30px"
                                type="submit">Logout</button>
                    </form>
                </c:if>
            </div>

        </div>
    </div>
</div>

</body>