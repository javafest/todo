<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%--
  User: erfan
  Date: 4/16/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task List</title>
</head>
<body>

<div class="container">
    <div class="row" style="padding-top: 5%">

        <div class="col-md-4 left-pane">
            <div class="row">
                <a href="/auth/welcome">Go to dashboard</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="mb-3">
                <legend style="margin-bottom: 10%">
                        <a href="/auth/welcome" class="link">
                            Todo <i class="fas fa-home"></i>
                        </a>
                </legend>

                <form:form method="POST" modelAttribute="task" cssClass="row g-3">

                    <div class="col-auto">
                        <form:input type="text"
                                    path="name"
                                    cssClass="form-control"
                                    placeholder="what to do.."
                                    autofocus="true"/>

                    </div>

                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">
                            <i class="fas fa-plus-circle"></i>
                        </button>
                    </div>

                    <div style="margin-top: 5px">
                        <form:errors path="name" cssClass="alert alert-danger form-control"/>
                    </div>
                </form:form>
            </div>

            <div class="mb-3">
                <legend>My tasks</legend>

                <c:if test="${taskList.size() == 0}">
                    <div class="alert alert-info" role="alert">
                        You have no tasks!
                    </div>
                </c:if>

                <table class="table">
                    <thead>
                        <tr>
                            <th>Sl.</th>
                            <th>Task</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${taskList}" var="t" varStatus="i">
                            <tr id="task-${t.id}">
                                <td>${i.index + 1}</td>
                                <td>${t.name}</td>
                                <td>
                                    <a href="/task/edit?id=${t.id}" class="link"><i class="fas fa-pen"></i></a>
                                </td>
                                <td><i class="fas fa-trash-alt"></i></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
