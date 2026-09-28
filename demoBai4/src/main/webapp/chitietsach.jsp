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
            position: relative;
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
            width: 300px;
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
            width: 220px;
            height: 25px;
            border: 1px solid #777;
            padding: 3px 6px;
        }

        /* DETAIL */
        .detail-area {
            flex: 1;
            padding-left: 2px;
        }

        .detail-title {
            margin: 3px 0 16px;
            color: #777;
            font-size: 14px;
        }

        .book-detail {
            width: 430px;
        }

        .book-image {
            display: block;
            width: 180px;
            height: 265px;
            object-fit: cover;
            margin-bottom: 4px;
        }

        .book-info {
            color: #666;
            font-size: 14px;
            line-height: 1.45;
        }

        .back-link {
            display: inline-block;
            margin-top: 14px;
            color: #555;
            font-size: 14px;
            text-decoration: underline;
        }

        .back-link:hover {
            color: #222;
        }

        .add-cart {
            margin-top: 10px;
            padding: 4px 10px;
            border: 1px solid #777;
            background: #eee;
            color: #555;
            font-family: "Times New Roman", Times, serif;
            cursor: pointer;
        }

        .not-found {
            color: #888;
            font-size: 14px;
        }

        @media (max-width: 980px) {
            .wrapper {
                width: 100%;
            }
        }

        @media (max-width: 650px) {
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
        }
    </style>
</head>

<body>

<div class="wrapper">

<%--    HEADER--%>
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

<%--    CONTENT--%>
    <div class="content">

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
            </div>

        </aside>


<%--        CHI TIET--%>
        <main class="detail-area">
<%--            giong dieu kien if else if--%>
            <c:choose>

                <c:when test="${not empty book}">

                    <div class="detail-title">
                        Product details: ${book.tittle} - Tác giả: ${book.author}
                    </div>

                    <div class="book-detail">

                        <img class="book-image"
                             src="${pageContext.request.contextPath}/imgs/${book.imgbook}"
                             alt="${book.tittle}">

                        <div class="book-info">
                            Price (VND): ${book.price}<br>
                            Quantity: ${book.quantity}
                        </div>

                        <form method="post"
                              action="${pageContext.request.contextPath}/cart">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="bookId" value="${book.id}">
                            <input type="hidden" name="qty" value="1">

                            <button type="submit" class="add-cart">
                                Add to cart
                            </button>
                        </form>

                        <a class="back-link"
                           href="${pageContext.request.contextPath}/books">
                            Back to Product List
                        </a>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="not-found">
                        Không tìm thấy sách.
                        <br><br>
                        <a class="back-link"
                           href="${pageContext.request.contextPath}/books">
                            Back to Product List
                        </a>
                    </div>

                </c:otherwise>

            </c:choose>

        </main>

    </div>
</div>

</body>
</html>
