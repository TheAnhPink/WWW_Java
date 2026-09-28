package iuh.fit.demobai4tulam.dao;

import iuh.fit.demobai4tulam.model.Book;
import iuh.fit.demobai4tulam.util.DBUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private DBUtil dbUtil;

    public BookDAO(DataSource dataSource) {
        this.dbUtil = new DBUtil(dataSource);
    }

    public List<Book> getAllBook(){
        List<Book> dsBooks= new ArrayList<>();
        String sql= "select * from books";
        try {
            Connection conn= dbUtil.getConnect();
            Statement st= conn.createStatement();
            ResultSet rs =st.executeQuery(sql);
            while(rs.next()){
                int id= rs.getInt(1);
                String tit= rs.getString(2);
                String aut= rs.getString(3);
                String img= rs.getString(4);
                double pri= rs.getDouble(5);
                int quant= rs.getInt(6);
                Book b= new Book(id,tit,aut,img,pri,quant);
                dsBooks.add(b);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dsBooks;

    }
    public Book getBookTheoID(int idtim){
        Book b= null;
        String sql= "select * from books where ID=?";
        try {
            Connection conn= dbUtil.getConnect();
            PreparedStatement st= conn.prepareStatement(sql);
            st.setInt(1,idtim);
            ResultSet rs =st.executeQuery();
            while(rs.next()){
                int id= rs.getInt(1);
                String tit= rs.getString(2);
                String aut= rs.getString(3);
                String img= rs.getString(4);
                double pri= rs.getDouble(5);
                int quant= rs.getInt(6);
                b= new Book(id,tit,aut,img,pri,quant);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return b;
    }

    public List<Book> getBookTheoTen(String tenTim) {
        List<Book> dsBooks= new ArrayList<>();
        String sql= "select * from books where title like ? or author like ?";
        try {
            Connection conn= dbUtil.getConnect();
            PreparedStatement st= conn.prepareStatement(sql);
            st.setString(1,"%"+tenTim+"%");
            st.setString(2,"%"+tenTim+"%");
            ResultSet rs =st.executeQuery();
            while(rs.next()){
                int id= rs.getInt(1);
                String tit= rs.getString(2);
                String aut= rs.getString(3);
                String img= rs.getString(4);
                double pri= rs.getDouble(5);
                int quant= rs.getInt(6);
                Book b= new Book(id,tit,aut,img,pri,quant);
                dsBooks.add(b);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dsBooks;
    }
}
