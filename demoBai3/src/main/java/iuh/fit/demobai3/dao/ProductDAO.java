package iuh.fit.demobai3.dao;

import iuh.fit.demobai3.model.Product;
import iuh.fit.demobai3.util.DBUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private DBUtil dbUtil;

    public ProductDAO(DataSource dataSource) {
        this.dbUtil = new DBUtil(dataSource);
    }

    public List<Product> getAllProduct(){
        List<Product> dsP= new ArrayList<>();
        String sql="select * from products";
        try {
            Connection conn= dbUtil.getConnection();
            Statement stm= conn.createStatement();
            ResultSet rs =stm.executeQuery(sql);
            while(rs.next()){
                int id= rs.getInt(1);
                String model= rs.getString(2);
                String des= rs.getString(3);
                int quan= rs.getInt(4);
                double price= rs.getDouble(5);
                String img= rs.getString(6);

                Product pm= new Product(id,model,des,quan,price,img);
                dsP.add(pm);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dsP;
    }

    public Product getProductById(int idTim){
        String sql= "select * from products where ID=?";

        try {
            Connection con= dbUtil.getConnection();
            PreparedStatement pstm= con.prepareStatement(sql);
            pstm.setInt(1,idTim);
            ResultSet rs= pstm.executeQuery();
            while(rs.next()){
                int id= rs.getInt(1);
                String model= rs.getString(2);
                String des= rs.getString(3);
                int quan= rs.getInt(4);
                double price= rs.getDouble(5);
                String img= rs.getString(6);

                Product pm= new Product(id,model,des,quan,price,img);
                return pm;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
