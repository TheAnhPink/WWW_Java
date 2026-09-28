<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 10px;
            background: #fff;
            font-family: "Times New Roman", Times, serif;
            color: #777;
            font-size: 14px;
        }

        .wrapper {
            width: 960px;
            min-height: 500px;
            margin: 0 auto;
            border: 1px solid #d2d2d2;
            background: #fff;
        }

        /* HEADER */
        .header {
            height: 92px;
            padding: 18px 20px 0;
            background: linear-gradient(to bottom, #b9b0a0, #a79d8c);
            border-bottom: 8px solid #214652;
        }

        .logo {
            display: inline-block;
            padding: 5px 10px;
            background: rgba(75, 75, 70, .45);
            color: white;
            font-size: 25px;
            font-weight: bold;
            text-shadow: 1px 1px 2px #555;
        }

        .menu {
            float: right;
            margin-top: 12px;
        }

        .menu a {
            display: inline-block;
            margin-left: 6px;
            padding: 8px 14px;
            background: rgba(80, 75, 68, .55);
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .menu a:hover {
            background: #6b655b;
        }

        /* CONTENT */
        .content {
            display: flex;
            min-height: 410px;
            padding: 12px 10px 30px;
        }

        .sidebar {
            width: 250px;
            padding-right: 20px;
        }

        .sidebar-box {
            margin-bottom: 34px;
        }

        .sidebar-title {
            margin: 4px 0 16px;
            color: #888;
            font-size: 18px;
            text-transform: uppercase;
        }

        .about-text {
            padding: 12px 10px;
            background: #eee;
            color: #888;
            font-size: 12px;
            line-height: 1.6;
        }

        .about-text a {
            color: #555;
            font-weight: bold;
            text-decoration: underline;
        }

        .search-box input {
            width: 185px;
            height: 25px;
            border: 1px solid #777;
            padding: 3px 6px;
        }

        .cart-link {
            display: block;
            margin-top: 20px;
            color: #555;
            text-decoration: underline;
            font-size: 12px;
        }

        /* CART */
        .cart-area {
            flex: 1;
        }

        .cart-title {
            text-align: center;
            margin: 0 0 5px;
            color: #777;
            font-size: 14px;
            text-transform: uppercase;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #777;
        }

        th {
            padding: 7px 6px;
            background: #334b56;
            color: white;
            border-right: 1px solid #777;
            text-align: left;
            font-weight: bold;
        }

        td {
            padding: 5px 6px;
            border: 1px solid #ccc;
            color: #777;
            vertical-align: middle;
        }

        tr:nth-child(even) td {
            background: #f8f8f8;
        }

        .remove-link {
            color: #555;
            text-decoration: underline;
        }

        .remove-link:hover {
            color: #000;
        }

        .total-row td {
            text-align: right;
            font-weight: normal;
            background: #fff !important;
        }

        .total-label {
            text-align: right !important;
        }

        .actions {
            margin-top: 18px;
        }

        .actions a,
        .actions button {
            display: inline-block;
            padding: 4px 8px;
            border: 1px solid #bbb;
            background: #eee;
            color: #555;
            font-family: "Times New Roman", Times, serif;
            font-size: 13px;
            text-decoration: none;
            cursor: pointer;
        }

        .actions a:hover,
        .actions button:hover {
            background: #ddd;
        }

        .empty-cart {
            padding: 20px 0;
            color: #777;
        }

        @media (max-width: 980px) {
            .wrapper {
                width: 100%;
            }
        }

        @media (max-width: 700px) {
            .content {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding-right: 0;
                margin-bottom: 20px;
            }

            .menu {
                float: none;
                margin-top: 12px;
            }

            .header {
                height: auto;
                padding-bottom: 12px;
            }

            .cart-area {
                overflow-x: auto;
            }

            table {
                min-width: 600px;
            }
        }
    </style>
</head>

<body>

<div class="wrapper">

    <!-- HEADER -->
    <div class="header">
        <span class="logo">IUH BOOKSTORE</span>

        <div class="menu">
            <a href="${pageContext.request.contextPath}/books">HOME</a>
            <a href="#">EXAMPLES</a>
            <a href="#">SERVICES</a>
            <a href="${pageContext.request.contextPath}/books">PRODUCTS</a>
            <a href="#">CONTACT</a>
        </div>
    </div>

    <!-- CONTENT -->
    <div class="content">

        <!-- SIDEBAR -->
        <aside class="sidebar">

            <div class="sidebar-box">
                <div class="sidebar-title">ABOUT US</div>

                <div class="about-text">
                    About us information will be here...
                    &nbsp;&nbsp;
                    <a href="#">Read More »</a>
                </div>
            </div>

            <div class="sidebar-box">
                <div class="sidebar-title">SEARCH SITE</div>

                <div class="search-box">
                    <form method="get"
                          action="${pageContext.request.contextPath}/books">
                        <input type="text" name="search">
                    </form>
                </div>

                <a class="cart-link"
                   href="${pageContext.request.contextPath}/cart">
                    Shopping cart (<c:out value="${cart.items.size()}"/>)
                </a>
            </div>

        </aside>

        <!-- SHOPPING CART -->
        <main class="cart-area">

            <div class="cart-title">
                YOUR SHOPPING CART
            </div>

            <c:choose>

                <c:when test="${not empty cart.items}">

                    <table>
                        <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td>
                                        ${item.book.id}
                                </td>

                                <td>
                                        ${item.book.tittle} - Tác giả: ${item.book.author}
                                </td>

                                <td>
                                        ${item.book.price}
                                </td>

                                <td>
                                        ${item.quantity}
                                </td>

                                <td>
                                        ${item.subtotal}
                                </td>

                                <td>
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/cart"
                                          style="margin:0;">

                                        <input type="hidden"
                                               name="action"
                                               value="remove">

                                        <input type="hidden"
                                               name="bookId"
                                               value="${item.book.id}">

                                        <button type="submit"
                                                style="border:0;background:none;padding:0;color:#555;text-decoration:underline;cursor:pointer;font-family:'Times New Roman',Times,serif;">
                                            Remove
                                        </button>

                                    </form>
                                </td>
                            </tr>
                        </c:forEach>

                        <tr class="total-row">
                            <td colspan="4" class="total-label">
                                Total price
                            </td>

                            <td colspan="2">
                                (VND) ${cart.total}
                            </td>
                        </tr>

                        </tbody>
                    </table>

                    <div class="actions">

                        <form method="get"
                              action="${pageContext.request.contextPath}/checkout"
                              style="display:inline;">

                            <input type="hidden"
                                   name="action"
                                   value="checkout">

                            <button type="submit">
                                Checkout
                            </button>

                        </form>

                        <a href="${pageContext.request.contextPath}/books">
                            Continue shopping
                        </a>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="empty-cart">

                        Your shopping cart is empty.

                        <br><br>

                        <a class="remove-link"
                           href="${pageContext.request.contextPath}/books">
                            Continue shopping
                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </main>

    </div>
</div>

</body>
</html>
