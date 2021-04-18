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
                This is a simple TODO Application!
            </div>
        </div>
    </div>
</div>

</body>