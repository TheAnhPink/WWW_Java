package iuh.fit.demobai3.model;

import jakarta.enterprise.context.SessionScoped;

import java.io.Serializable;

@SessionScoped
public class CartItemBean implements Serializable {
    private Product product;
    private int quantity;

    public CartItemBean() {
    }

    public CartItemBean(Product product) {
        this.product = product;
        this.quantity = 1;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void themSoLuong(){
        this.quantity++;
    }

    public double getTongTien1SanPham(){
        return product.getPrice()*quantity;
    }
}
