<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%--
  User: erfan
  Date: 4/15/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-4" style="padding-top: 20%">

            <legend>Login</legend>

            <div class="mb-3">
                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>

                <c:if test="${logout != null}">
                    <div class="alert alert-success" role="alert">
                        ${logout}
                    </div>
                </c:if>
            </div>

            <form:form method="POST" modelAttribute="user">

                <div class="mb-3">
                    <form:input type="text"
                                path="username"
                                class="form-control"
                                placeholder="Username"
                                autofocus="true"/>
                </div>

                <div class="mb-3">
                    <form:input type="password"
                                path="password"
                                class="form-control"
                                placeholder="Password"/>
                </div>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            </form:form>

            <div class="mb-3" style="margin-top: 10px">
                <a href="/auth/registration">Not a registered user? Register here!</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
