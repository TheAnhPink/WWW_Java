package iuh.fit.demobai3.controller;

import iuh.fit.demobai3.dao.ProductDAO;
import iuh.fit.demobai3.model.Product;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet({"/products", "/product"})
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;
    @Resource(name = "jdbc/shopdb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr= req.getParameter("id");
        if(idStr!=null){
            int idTim= Integer.parseInt(idStr);
            Product p = productDAO.getProductById(idTim);
            if(p!=null){
                req.setAttribute("product",p);
                req.getRequestDispatcher("/product-detail.jsp").forward(req,resp);
            }else{
                resp.sendError(HttpServletResponse.SC_NOT_FOUND,"Khong tim thay product");
                return;
            }
        }

        List<Product> dsProducts= productDAO.getAllProduct();
        req.setAttribute("products",dsProducts);
        req.getRequestDispatcher("/products.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
