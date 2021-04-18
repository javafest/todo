<%--
  User: erfan
  Date: 4/14/21
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/font-awesome-5.15.3/css/all.css">

    <script src="/js/jquery-3.6.0.min.js"></script>

    <title>
        <sitemesh:write property='title'/>
    </title>

    <sitemesh:write property='head'/>

    <style>
        .link {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<%--Header--%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff8e1;">
    <div class="container-fluid" style="padding-left: 35%; padding-right: 35%">
        <p class="navbar-brand" style="font-family: 'Roboto'">
            <i class="fas fa-tasks"></i>
            TODO APP
        </p>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link active" aria-current="page" href="/auth/welcome">Dashboard</a>
                    <a class="nav-link active" aria-current="page" href="/task/show">Task List</a>
                </div>
            </div>

            <form class="d-flex" id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button class="btn btn-sm btn-danger" type="submit">Logout</button>
            </form>
        </c:if>
    </div>
</nav>

<sitemesh:write property='body'/>

<%--Footer--%>
<nav class="navbar fixed-bottom navbar-light" style="background-color: #fff8e1;">
    <div class="container-fluid" style="padding-left: 40%">
        <div style="padding-top: 15px; text-align: center; font-size: 14px">
            <p> © Therap BD Ltd. 2003-2021. All Rights Reserved</p>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>