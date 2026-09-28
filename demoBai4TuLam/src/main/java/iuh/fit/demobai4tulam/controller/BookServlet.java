package iuh.fit.demobai4tulam.controller;

import iuh.fit.demobai4tulam.dao.BookDAO;
import iuh.fit.demobai4tulam.model.Book;
import iuh.fit.demobai4tulam.model.CartItemBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/books","/book"})
public class BookServlet extends HttpServlet {
    private  BookDAO bookDAO;
    @Resource(name = "jdbc/bookstoredb")
    DataSource dataSource;

    @Override
    public void init() throws ServletException {
        bookDAO= new BookDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr= req.getParameter("id");
        if(idStr !=null){
            int idTim= Integer.parseInt(idStr);
            Book b= bookDAO.getBookTheoID(idTim);
            if(b!=null){
                req.setAttribute("book",b);
                req.getRequestDispatcher("/chitietsach.jsp").forward(req,resp);
            }
            req.setAttribute("loi","Không tìm thấy sách");
            req.getRequestDispatcher("/chitietsach.jsp").forward(req,resp);


        }else{
            String tenTim= req.getParameter("tenTim");
            List<Book> dsBook;
            if(tenTim!=null && !tenTim.trim().isEmpty()){
                dsBook= bookDAO.getBookTheoTen(tenTim);
            }else{
                dsBook= bookDAO.getAllBook();
            }

            req.setAttribute("books",dsBook);
            req.getRequestDispatcher("/danhsach.jsp").forward(req,resp);
        }
    }
}
