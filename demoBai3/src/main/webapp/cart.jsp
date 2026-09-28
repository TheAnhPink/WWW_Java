<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/25/2026
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Cart</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
      margin-bottom: 20px;
    }
    th, td {
      border-bottom: 1px solid lightgray;
      padding: 12px 8px;
      text-align: left;
    }
    th {
      background-color: white;
      border-top: 2px solid black;
      border-bottom: 2px solid black;
    }
    input[type="number"] {
      width: 250px;
      padding: 5px;
      text-align: left;
    }
    button {
      padding: 5px 10px;
      cursor: pointer;
    }
    .total-row {
      font-weight: bold;
      border-top: 2px solid black;
      border-bottom: 2px solid black;
    }
    .actions {
      margin-top: 15px;
      margin-bottom: 15px;
    }
    a {
      color: blue;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<h1>Cart</h1>

<table>
  <thead>
  <tr>
    <th>Model</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>SubTotal</th>
    <th>Action</th>
  </tr>
  </thead>
  <tbody>
    <c:if test="${empty sessionScope.cart or empty sessionScope.cart.dsCart}">
      <tr>
        <td>Gior hàng rỗng</td>
      </tr>
    </c:if>
    <c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.dsCart}">
      <c:forEach var="ci" items="${sessionScope.cart.dsCart}">
        <tr>
          <td>${ci.product.model}</td>
          <td>
            <form action="${pageContext.request.contextPath}/cart" method="post">
              <input type="number" name="soluong" min="0" value="${ci.quantity}" id="">
              <input type="hidden" name="id" value="${ci.product.id}">
              <input type="hidden" name="action" value="sua" id="">
              <button type="submit">Cập nhật</button>
            </form>
          </td>
          <td>${ci.product.price}</td>
          <td>${ci.getTongTien1SanPham()}</td>
          <td>
            <form action="${pageContext.request.contextPath}/cart" method="post">
              <input type="hidden" name="id" value="${ci.product.id}" id="">
              <input type="hidden" name="action" value="xoa">
              <button type="submit">Xóa</button>
            </form>
          </td>
        </tr>
      </c:forEach>
      <tr class="total-row">
        <td colspan="3">
          <strong>Total: </strong>
        </td>
        <td colspan="2">
          <strong>${sessionScope.cart.getTongTienGioHang()}</strong>
        </td>
      </tr>
      <tr>
        <td>
          <form action="${pageContext.request.contextPath}/cart" method="post">
            <input type="hidden" name="action" value="clear" id="">
            <button type="submit">Xóa hết giỏ hàng</button>

          </form>
        </td>
      </tr>
    </c:if>

  </tbody>


</table>
<a href="${pageContext.request.contextPath}/products">Tiếp tục mua</a>

</body>
</html>