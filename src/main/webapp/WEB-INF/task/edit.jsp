<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%--
  User: erfan
  Date: 4/17/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Edit</title>
</head>
<body>
<div class="container">
    <div class="row content">

        <div class="col-md-4"></div>

        <div class="col-md-4">
            <div class="mb-3">
                <legend style="margin-bottom: 10%">
                    <a href="/auth/welcome" class="link">
                        Todo <i class="fas fa-home"></i>
                    </a>
                </legend>

                <form:form method="POST" modelAttribute="task">

                    <h5>Edit task</h5>

                    <div class="mb-3">
                        <div>
                            <form:input type="text"
                                        path="name"
                                        cssClass="form-control"
                                        autofocus="true"/>

                        </div>

                        <div style="margin-top: 5px">
                            <form:errors path="name" cssClass="alert alert-danger form-control"/>
                        </div>
                    </div>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
