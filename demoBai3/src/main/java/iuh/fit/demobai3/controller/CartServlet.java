package iuh.fit.demobai3.controller;

import iuh.fit.demobai3.dao.ProductDAO;
import iuh.fit.demobai3.model.CartBean;
import iuh.fit.demobai3.model.Product;
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
    private ProductDAO productDAO;
    @Resource(name="jdbc/shopdb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDAO= new ProductDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/cart.jsp").forward(req,resp);
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

        try {
            if("them".equals(action)){
                int id= Integer.parseInt(req.getParameter("id"));
                Product pm =productDAO.getProductById(id);
                cartBean.themSanPham(pm);
            }else if("xoa".equals(action)){
                int id= Integer.parseInt(req.getParameter("id"));
                cartBean.removeProduct(id);
            }else if("sua".equals(action)){
                int id= Integer.parseInt(req.getParameter("id"));
                int soLuong= Integer.parseInt(req.getParameter("soluong"));
                cartBean.updateQuantity(id,soLuong);
            }else if("clear".equals(action)){
                cartBean.clearGioHang();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect(req.getContextPath()+ "/cart");
    }
}
