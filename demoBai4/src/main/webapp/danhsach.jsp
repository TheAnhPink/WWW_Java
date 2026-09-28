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
            padding: 20px;
            background: #ffffff;
            font-family: "Times New Roman", Times, serif;
            color: #555;
        }

        .wrapper {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #d5d5d5;
            background: #fff;
        }

        /* ===== HEADER ===== */
        .header {
            height: 100px;
            padding: 18px 18px 0;
            background: linear-gradient(to bottom, #b7ae9d, #9e9584);
            border-bottom: 8px solid #1f4350;
            position: relative;
        }

        .logo {
            display: inline-block;
            padding: 5px 10px;
            color: #fff;
            background: rgba(70, 70, 65, .45);
            font-size: 25px;
            font-weight: bold;
            letter-spacing: 1px;
            text-shadow: 1px 1px 2px #555;
        }

        .menu {
            float: right;
            margin-top: 17px;
        }

        .menu a {
            display: inline-block;
            margin-left: 7px;
            padding: 8px 15px;
            color: #fff;
            background: rgba(80, 75, 68, .55);
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .menu a:hover {
            background: #6d665c;
        }

        /* ===== CONTENT ===== */
        .content {
            display: flex;
            padding: 20px 10px 10px;
            min-height: 570px;
        }

        .sidebar {
            width: 300px;
            padding-right: 20px;
        }

        .sidebar-box {
            margin-bottom: 35px;
        }

        .sidebar-title {
            margin-bottom: 18px;
            color: #888;
            font-size: 18px;
            text-transform: uppercase;
        }

        .about-text {
            padding: 12px 10px;
            background: #eee;
            color: #888;
            font-size: 12px;
            line-height: 1.7;
        }

        .about-text a {
            color: #555;
            font-weight: bold;
            text-decoration: underline;
        }

        .search-box input {
            width: 215px;
            height: 25px;
            border: 1px solid #777;
            padding: 3px 6px;
        }

        /* ===== BOOK LIST ===== */
        .book-area {
            flex: 1;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        .book-card {
            min-height: 265px;
            border: 1px solid #777;
            text-align: center;
            padding: 7px 6px 5px;
            background: #fff;
        }

        .book-title {
            height: 38px;
            color: #666;
            font-size: 14px;
            line-height: 1.15;
            margin-bottom: 2px;
        }

        .book-image {
            width: 105px;
            height: 145px;
            object-fit: cover;
            display: block;
            margin: 0 auto 5px;
        }

        .book-info {
            font-size: 13px;
            line-height: 1.35;
            color: #666;
        }

        .book-link {
            color: #555;
            text-decoration: underline;
            cursor: pointer;
        }

        .book-link:hover {
            color: #222;
        }

        .add-cart-form {
            margin: 0;
        }

        .add-cart {
            border: none;
            padding: 0;
            background: transparent;
            color: #555;
            font-family: "Times New Roman", Times, serif;
            font-size: 13px;
            text-decoration: underline;
            cursor: pointer;
        }

        .add-cart:hover {
            color: #222;
        }

        .empty {
            padding: 30px;
            text-align: center;
            color: #888;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 960px) {
            .wrapper {
                width: 100%;
            }

            .content {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding-right: 0;
                margin-bottom: 20px;
            }

            .search-box input {
                width: 100%;
            }
        }

        @media (max-width: 650px) {
            .header {
                height: auto;
            }

            .menu {
                float: none;
                margin-top: 15px;
                padding-bottom: 10px;
            }

            .menu a {
                margin: 3px 2px;
            }

            .book-grid {
                grid-template-columns: repeat(2, 1fr);
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
                        <input type="text"
                               name="search"
                               value="${param.search}"
                               placeholder="">
                    </form>
                </div>
            </div>

        </aside>

        <!-- BOOKS -->
        <main class="book-area">

            <div class="book-grid">

                <c:choose>

                    <c:when test="${not empty books}">

                        <c:forEach var="b" items="${books}">

                            <div class="book-card">

                                <div class="book-title">
                                        ${b.tittle} - Tác giả: ${b.author}
                                </div>

                                <img class="book-image"
                                     src="${pageContext.request.contextPath}/imgs/${b.imgbook}"
                                     alt="${b.tittle}">

                                <div class="book-info">
                                    Price: ${b.price}<br>
                                    Quantity: ${b.quantity}<br>

                                    <a class="book-link"
                                       href="${pageContext.request.contextPath}/books?id=${b.id}">
                                        Product details
                                    </a>
                                    <br>

                                    <form class="add-cart-form"
                                          method="post"
                                          action="${pageContext.request.contextPath}/cart">

                                        <input type="hidden"
                                               name="action"
                                               value="add">

                                        <input type="hidden"
                                               name="bookId"
                                               value="${b.id}">

                                        <input type="hidden"
                                               name="qty"
                                               value="1">

                                        <button type="submit"
                                                class="add-cart">
                                            Add to cart
                                        </button>

                                    </form>
                                </div>

                            </div>

                        </c:forEach>

                    </c:when>

                    <c:otherwise>
                        <div class="empty">
                            Không có sách để hiển thị.
                        </div>
                    </c:otherwise>

                </c:choose>

            </div>

        </main>

    </div>
</div>

</body>
</html>
