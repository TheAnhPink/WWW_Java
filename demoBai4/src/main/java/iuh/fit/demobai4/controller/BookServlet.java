package iuh.fit.demobai4.controller;

import iuh.fit.demobai4.beans.Book;
import iuh.fit.demobai4.dao.BookDAO;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/books")
public class BookServlet extends HttpServlet {

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

        //  xem chi tiết theo ID
        String idstr = req.getParameter("id");
        if (idstr != null) {
            try {
                int id = Integer.parseInt(idstr);
                Book book = bookDAO.getBookById(id);
                if (book != null) {
                    req.setAttribute("book", book);
                    RequestDispatcher dispatcher =
                            getServletContext().getRequestDispatcher("/chitietsach.jsp");
                    dispatcher.forward(req, resp);
                    return;
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                    return;
                }
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
                return;
            }
        }

        // tìm bằng tên hoặc get all
        String search = req.getParameter("search");
        List<Book> books;
        if (search != null && !search.trim().isEmpty()) {
            books = bookDAO.searchBooks(search);
        } else {
            books = bookDAO.getAllBooks();
        }

        req.setAttribute("books", books);
        req.getRequestDispatcher("danhsach.jsp").forward(req, resp);
    }
}