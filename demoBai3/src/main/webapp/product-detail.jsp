<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/25/2026
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Detail</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }

    img {
      width: 150px;
      height: 150px;
      object-fit: contain;
    }

    a {
      display: inline-block;
      margin-top: 10px;
      color: #007bff;
      text-decoration: none;
    }
  </style>
</head>
<body>
<h1>Chi tiết sản phẩm</h1>
<strong>${product.model}</strong>
<br>
<img src="${pageContext.request.contextPath}/img/${product.imgurl}" alt="">
<p>${product.description}</p>
<p>Giá: ${product.price}</p>
<p>Số lượng còn: ${product.quantity}</p>
<a href="${pageContext.request.contextPath}/products">Quay lại danh sách sản phẩm</a>
</body>
</html>