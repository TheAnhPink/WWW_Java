package iuh.fit.demobai3.model;

import jakarta.enterprise.context.SessionScoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SessionScoped
public class CartBean implements Serializable {
    private List<CartItemBean> dsCart= new ArrayList<>();

    public CartBean(List<CartItemBean> dsCart) {
        this.dsCart = dsCart;
    }

    public CartBean() {
    }

    public List<CartItemBean> getDsCart() {
        return dsCart;
    }

    public void setDsCart(List<CartItemBean> dsCart) {
        this.dsCart = dsCart;
    }

        public void themSanPham(Product pm){
            dsCart.stream().filter(c->c.getProduct().getId()==pm.getId())
                    .findFirst()
                    .ifPresentOrElse(c-> c.themSoLuong() , ()-> dsCart.add(new CartItemBean(pm)));
        }

    public void removeProduct(int proID){
        dsCart.removeIf(c->c.getProduct().getId()==proID);
    }

    public void updateQuantity(int proID, int quan){
        for(CartItemBean c: dsCart){
            if(c.getProduct().getId()==proID){
                if(quan>0){
                    c.setQuantity(quan);
                }else{
                    removeProduct(proID);
                }
                return;
            }
        }
    }
    public double getTongTienGioHang(){
        double tong=0;
        for (CartItemBean c: dsCart){
            tong+=c.getTongTien1SanPham() ;
        }
        return tong;
    }
    public void clearGioHang(){
        dsCart.clear();
    }


}
