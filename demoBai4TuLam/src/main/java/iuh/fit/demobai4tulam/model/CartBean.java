package iuh.fit.demobai4tulam.model;

import jakarta.enterprise.context.SessionScoped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SessionScoped
public class CartBean implements Serializable {
    private List<CartItemBean> dsItemSach= new ArrayList<>();

    public CartBean() {
    }

    public CartBean(List<CartItemBean> dsItemSach) {
        this.dsItemSach = dsItemSach;
    }

    public List<CartItemBean> getDsItemSach() {
        return dsItemSach;
    }

    public void setDsItemSach(List<CartItemBean> dsItemSach) {
        this.dsItemSach = dsItemSach;
    }
    public double getTongTienToanBoSanPham(){
        double tong=0;
        for(CartItemBean it: dsItemSach){
            tong+=it.tinhTongTien1SanPham();
        }
        return tong;
    }
    public void themSach(Book bm,int soluong){
        for(CartItemBean ci: dsItemSach){
            if(bm.getId()==ci.getBook().getId()){
                int slc=ci.getQuantity();
                ci.setQuantity(slc+soluong);
                return;
            }
        }
        dsItemSach.add(new CartItemBean(bm,soluong));

    }
    public void capNhatSoLuongSach(int id, int soluong){
        for(CartItemBean ci: dsItemSach){
            if(id==ci.getBook().getId()){
                ci.setQuantity(soluong);
                return;
            }

        }
    }
    public void clearGioHang(){
        dsItemSach.clear();
    }
    public void xoaSach(int id){
        dsItemSach.removeIf(it-> id==it.getBook().getId());
    }
}
