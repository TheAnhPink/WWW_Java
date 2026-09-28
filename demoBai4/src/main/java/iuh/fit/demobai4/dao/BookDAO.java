package iuh.fit.demobai4.dao;

import iuh.fit.demobai4.beans.Book;
import iuh.fit.demobai4.util.DBUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private DBUtil dbUtil;

    public BookDAO(DataSource dataSource) {
        dbUtil = new DBUtil(dataSource);
    }

    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM books";

        try (Connection conn = dbUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Long id = rs.getLong("ID");
                String tittle = rs.getString("TITTLE");
                String author = rs.getString("AUTHOR");
                double price = rs.getDouble("PRICE");
                String image = rs.getString("IMGBOOK");
                int quantity = rs.getInt("QUANTITY");
                Book b = new Book(id, tittle, author, price, image, quantity);
                list.add(b);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi kết nối hoặc truy vấn Database: " + e.getMessage(), e);
        }

        return list;
    }

    // Bổ sung hàm tìm kiếm theo tên hoặc tác giả để form search bên giao diện hoạt động
    public List<Book> searchBooks(String keyword) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE TITTLE LIKE ? OR AUTHOR LIKE ?";

        try (Connection conn = dbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String pattern = "%" + keyword + "%";
            ps.setString(1, pattern);
            ps.setString(2, pattern);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Long id = rs.getLong("ID");
                    String tittle = rs.getString("TITTLE");
                    String author = rs.getString("AUTHOR");
                    double price = rs.getDouble("PRICE");
                    String image = rs.getString("IMGBOOK");
                    int quantity = rs.getInt("QUANTITY");
                    list.add(new Book(id, tittle, author, price, image, quantity));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Book getBookById(long id) {
        String sql = "SELECT * FROM books WHERE ID=?";

        try (Connection conn = dbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Long bookid = rs.getLong("ID");
                    String tittle = rs.getString("TITTLE");
                    String author = rs.getString("AUTHOR");
                    double price = rs.getDouble("PRICE");
                    String image = rs.getString("IMGBOOK");
                    int quantity = rs.getInt("QUANTITY");

                    return new Book(bookid, tittle, author, price, image, quantity);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}