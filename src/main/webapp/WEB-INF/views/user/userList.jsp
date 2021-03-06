<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/resources/css/product.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
          integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<p>This sidenav is always shown.</p>
<p>1 ${cookie.keySet()} ${cookie.entrySet()}</p>
<p>2 ${sessionScope.values()}</p>
<p>2 ${session.toString()}</p>
<p>3 ${sessionScope.get("SPRING_SECURITY_CONTEXT").toString()}</p>


<p>4 ${pageContext.request}</p>
<p>5 ${pageContext.getRequest().toString()}</p>
<p>6 ${pageContext.getPage().toString()}</p>
<p>7 ${pageContext.getOut().toString()}</p>
<p>8 ${pageContext.getRequest().userPrincipal}</p>

<p>9 ${pageContext.getSession().toString()}</p>

<div class="sidenav">
    <a href="#">About</a>
    <a href="#">Services</a>
    <a href="#">Clients</a>
    <a href="#">Contact</a>
</div>

<div class="main">
    <div class="topnav">
        <a class="active" href="/productList">Products</a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
        <div class="search-container">
            <form action="/search">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>
    <div class="container">
        <h2>Condensed Table</h2>
        <p>The .table-condensed class makes a table more compact by cutting cell padding in half:</p>
        <table class="table table-condensed">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Mail</th>
                <th>Username</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="user">
                <tr id="${user.id}">
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.usermail}</td>
                    <td>${user.username}</td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" onclick="deleteUser(${user.id})">X
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>

<script>
    function deleteUser(userId) {
        $.post("deleteUser?${_csrf.parameterName}=${_csrf.token}",
            {
                name: "${pageContext.request.userPrincipal.name}",
                userId: userId
            },
            function (data) {
            });
        $("#" + userId).remove();
        alert("user removed successfully.");
    }
</script>

</body>
</html>