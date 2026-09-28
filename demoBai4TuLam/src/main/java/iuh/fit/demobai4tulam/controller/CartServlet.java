package iuh.fit.demobai4tulam.controller;

import iuh.fit.demobai4tulam.dao.BookDAO;
import iuh.fit.demobai4tulam.model.Book;
import iuh.fit.demobai4tulam.model.CartBean;
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
    BookDAO bookDAO;
    @Resource(name="jdbc/bookstoredb")
    DataSource dataSource;

    @Override
    public void init() throws ServletException {
        bookDAO= new BookDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/giohang.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        CartBean cartBean= (CartBean) session.getAttribute("cart");
        if(cartBean==null){
            cartBean= new CartBean();
            session.setAttribute("cart", cartBean);
        }

        String action= req.getParameter("action");

        if("them".equals(action)){
            int id= Integer.parseInt(req.getParameter("id"));
            int soluong= Integer.parseInt(req.getParameter("soLuong"));
            Book bm= bookDAO.getBookTheoID(id);

            cartBean.themSach(bm,soluong);
        }else if("xoa".equals(action)){
            int id= Integer.parseInt(req.getParameter("id"));
            cartBean.xoaSach(id);
        }

        resp.sendRedirect(req.getContextPath()+"/cart");
    }
}
