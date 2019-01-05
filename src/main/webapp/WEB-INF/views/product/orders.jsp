<%@ page contentType = "text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

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
                <th>Order</th>
                <th>User</th>
                <th>Product ID</th>
                <th>Product name</th>
                <th>Quantity</th>
                <th>Cost</th>
                <th>Delete order</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
            <tr id="${order.id}">
                <td>${order.id}</td>
                <td>${order.userName}</td>
                <td>${order.productId}</td>
                <td>${order.productName}</td>
                <td>${order.quantity}</td>
                <td>${order.cost}</td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm" onclick="deleteOrder(${order.id})">X</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <h2>Your basket</h2>
    <p>This sidenav is always shown.</p>

        <div class="container">

            <c:forEach items="${list}" var="item">
            <div class="col-xs-12 col-md-6" id="${item.id}">
                <!-- First product box start here-->
                <div class="prod-info-main prod-wrap clearfix">
                    <div class="row">
                        <%--<div class="col-md-5 col-sm-12 col-xs-12">--%>
                            <%--<div class="product-image">--%>
                                <%--<img src="images/products/p4.png" class="img-responsive">--%>
                                <%--<span class="tag2 hot">--%>
							<%--HOT--%>
						<%--</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-deatil">
                                <h5 class="name">
                                    <a href="#">
                                        <c:out value="140${item.id} ${item.name}"/>
                                    </a>
                                    <a href="#">
                                        <span>${item.category}</span>
                                    </a>

                                </h5>
                                <p class="price-container">
                                    <span>${item.price}</span>
                                </p>
                                <span class="tag1"></span>
                            </div>
                            <div class="description">
                                <p>${item.description}</p>
                            </div>
                            <div class="product-info smart-form">
                                <div class="row">
                                    <div class="col-md-12">
                                        <a onclick="removeFromBasket(${item.id})" class="btn btn-danger">Remove from basket</a>
                                        <%--<a href="product/${item.id}" class="btn btn-info">More info</a>--%>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="rating">Rating:
                                            <label for="stars-rating-5"><i class="fa fa-star text-danger"></i></label>
                                            <label for="stars-rating-4"><i class="fa fa-star text-danger"></i></label>
                                            <label for="stars-rating-3"><i class="fa fa-star text-danger"></i></label>
                                            <label for="stars-rating-2"><i class="fa fa-star text-warning"></i></label>
                                            <label for="stars-rating-1"><i class="fa fa-star text-warning"></i></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end product -->
            </div>
            </c:forEach>

        </div>
        <button type="button" class="btn btn-success btn-lg" onclick="createOrder()" style="right: 40px; position: absolute">Order now</button>
    </div>
</div>

<script>
    function deleteOrder(orderId) {
        $.post("deleteOrder?${_csrf.parameterName}=${_csrf.token}",
            {
                name: "${pageContext.request.userPrincipal.name}",
                orderId: orderId
            },
            function(data){
            });
        $("#" + orderId).remove();
        alert("Order removed successfully.");
    }
</script>

</body>
</html>