package iuh.fit.demobai4tulam.model;

import jakarta.enterprise.context.SessionScoped;

import java.io.Serializable;
@SessionScoped
public class CartItemBean implements Serializable {
    private Book book;
    private int quantity;

    public CartItemBean() {
    }

    public CartItemBean(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double tinhTongTien1SanPham(){
        return book.getPrice()*quantity;
    }

    public void tangSoLuong(){
        quantity++;
    }

}
