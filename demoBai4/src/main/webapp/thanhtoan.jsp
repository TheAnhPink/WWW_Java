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
            padding: 5px;
            font-family: "Times New Roman", Times, serif;
            font-size: 13px;
            color: #777;
            background: white;
        }

        .container {
            width: 960px;
            min-height: 500px;
            margin: 0 auto;
            border: 1px solid #aaa;
        }

        /* HEADER */
        .header {
            height: 90px;
            padding: 12px;
            background: linear-gradient(to bottom, #b8b0a2, #a59b89);
            border-bottom: 7px solid #214653;
        }

        .logo {
            display: inline-block;
            padding: 5px 10px;
            color: white;
            background: rgba(80, 80, 75, 0.5);
            font-size: 25px;
            font-weight: bold;
        }

        .menu {
            float: right;
            margin-top: 8px;
        }

        .menu a {
            display: inline-block;
            padding: 8px 14px;
            margin-left: 5px;
            color: white;
            background: rgba(80, 75, 68, 0.55);
            text-decoration: none;
            font-weight: bold;
        }

        .menu a:hover {
            background: #777;
        }

        /* CONTENT */
        .content {
            display: flex;
            padding: 10px;
        }

        /* SIDEBAR */
        .sidebar {
            width: 300px;
            padding-right: 20px;
        }

        .sidebar-title {
            margin: 8px 0 15px;
            font-size: 18px;
            color: #888;
        }

        .about {
            padding: 15px 10px;
            background: #eee;
            margin-bottom: 35px;
        }

        .about a {
            color: #555;
            font-weight: bold;
        }

        .search input {
            width: 220px;
            height: 25px;
            border: 1px solid #777;
        }

        .cart-link {
            display: block;
            margin-top: 18px;
            color: #666;
            text-decoration: underline;
        }

        /* CHECKOUT */
        .checkout {
            flex: 1;
        }

        .checkout-title {
            text-align: center;
            margin-bottom: 5px;
            font-size: 13px;
        }

        .checkout-title a {
            color: #777;
            text-decoration: underline;
        }

        .checkout-form {
            width: 100%;
            border: 1px solid #777;
        }

        .row {
            display: flex;
            min-height: 40px;
            border-bottom: 1px solid #ccc;
        }

        .row:last-child {
            border-bottom: none;
        }

        .label {
            width: 140px;
            padding: 10px 8px;
            border-right: 1px solid #ccc;
        }

        .field {
            flex: 1;
            padding: 7px;
        }

        .field input[type="text"] {
            height: 25px;
            border: 1px solid #777;
            padding: 3px 5px;
        }

        .fullname {
            width: 125px;
        }

        .address {
            width: 220px;
        }

        .total {
            width: 125px;
        }

        .payment input {
            margin-right: 3px;
        }

        .payment label {
            margin-right: 5px;
        }

        .actions {
            text-align: center;
            padding: 7px;
        }

        .actions button {
            padding: 3px 10px;
            margin: 0 2px;
            border: 1px solid #ccc;
            background: #eee;
            color: #555;
            cursor: pointer;
            font-family: "Times New Roman", Times, serif;
        }

        .actions button:hover {
            background: #ddd;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">

        <span class="logo">
            IUH BOOKSTORE
        </span>

        <div class="menu">
            <a href="${pageContext.request.contextPath}/books">HOME</a>
            <a href="#">EXAMPLES</a>
            <a href="#">SERVICES</a>
            <a href="${pageContext.request.contextPath}/books">PRODUCTS</a>
            <a href="#">CONTACT</a>
        </div>

    </div>


    <div class="content">

        <div class="sidebar">

            <div class="sidebar-title">
                ABOUT US
            </div>

            <div class="about">
                About us information will be here...
                &nbsp;&nbsp;
                <a href="#">Read More »</a>
            </div>

            <div class="sidebar-title">
                SEARCH SITE
            </div>

            <div class="search">
                <form action="${pageContext.request.contextPath}/books"
                      method="get">

                    <input type="text" name="search">

                </form>
            </div>

            <a class="cart-link"
               href="${pageContext.request.contextPath}/cart">
                Shopping cart
            </a>

        </div>


        <!-- thanh toan -->
        <div class="checkout">

            <div class="checkout-title">
                Checkout - <a href="#">Already registered?</a>
            </div>

            <form class="checkout-form"
                  action="${pageContext.request.contextPath}/checkout"
                  method="post">

                <div class="row">

                    <div class="label">
                        Fullname:
                    </div>

                    <div class="field">
                        <input type="text"
                               name="fullname"
                               class="fullname">
                    </div>

                </div>


                <div class="row">

                    <div class="label">
                        Shipping address:
                    </div>

                    <div class="field">
                        <input type="text"
                               name="shippingAddress"
                               class="address">
                    </div>

                </div>


                <div class="row">

                    <div class="label">
                        Total price:
                    </div>

                    <div class="field">

                        <input type="text"
                               name="totalPrice"
                               class="total"
                               value="${cart.total}"
                               readonly>

                    </div>

                </div>


                <div class="row">

                    <div class="label">
                        Payment method
                    </div>

                    <div class="field payment">

                        <label>
                            <input type="radio"
                                   name="paymentMethod"
                                   value="paypal">
                            Paypal
                        </label>

                        <label>
                            <input type="radio"
                                   name="paymentMethod"
                                   value="atm">
                            ATM Debit
                        </label>

                        <label>
                            <input type="radio"
                                   name="paymentMethod"
                                   value="visa">
                            Visa/Master card
                        </label>

                    </div>

                </div>


                <div class="actions">

                    <button type="submit" onclick="alert('Thanh toán thành công')">
                        Save
                    </button>

                    <form action="${pageContext.request.contextPath}/cart" method="get">
                        <button type="submit">Cancel</button>
                    </form>

                </div>

            </form>

        </div>

    </div>

</div>

</body>
</html>