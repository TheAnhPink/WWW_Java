<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/25/2026
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Products</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }
    .grid {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .card {
      border: 1px solid black;
      padding: 15px;
      width: 200px;
      text-align: center;
      border-radius: 5px;
    }
    .card img {
      width: 100px;
      height: 100px;
      object-fit: cover;
    }
    .card input {
      width: 50px;
      text-align: center;
      margin-bottom: 5px;
    }
    .card button {
      width: 100%;
      padding: 5px;
      background: green;
      color: white;
      cursor: pointer;
    }
    .card a {
      display: block;
      margin-top: 8px;
      font-size: 14px;
      text-decoration: none; }
  </style>
</head>
<body>

<a href="${pageContext.request.contextPath}/cart">View cart</a>

<div class="grid">
  <c:forEach var="p" items="${products}">
    <div class="card">
      <strong>${p.model}</strong>
      <br>
      <img src="${pageContext.request.contextPath}/img/${p.imgurl}" alt="">
      <p>${p.price}</p>

      <form action="${pageContext.request.contextPath}/cart" method="post">
        <input type="hidden" name="id" value="${p.id}">
        <input type="number" name="soLuong" value="1" min="1" max="${p.quantity}">
        <br>
        <input type="hidden" name="action" value="them">
        <button type="submit">Add to cart</button>
      </form>

      <a href="${pageContext.request.contextPath}/product?id=${p.id}">Product Detail</a>
    </div>
  </c:forEach>
</div>

</body>
</html>