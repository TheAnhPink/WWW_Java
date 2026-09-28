package iuh.fit.demobai4.controller;

import iuh.fit.demobai4.beans.Book;
import iuh.fit.demobai4.beans.CartBean;
import iuh.fit.demobai4.dao.BookDAO;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Resource(name = "jdbc/bookstoredb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            bookDAO = new BookDAO(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("giohang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        CartBean cart = (CartBean) session.getAttribute("cart");

        if (cart == null) {
            cart = new CartBean();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");
        try {
            if ("add".equals(action)) {
                long id = Long.parseLong(req.getParameter("bookId"));
                Book b = bookDAO.getBookById(id);
                cart.addBook(b);
            } else if ("remove".equals(action)) {
                long id = Long.parseLong(req.getParameter("bookId"));
                cart.removeBook(id);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("cart");
    }
}
