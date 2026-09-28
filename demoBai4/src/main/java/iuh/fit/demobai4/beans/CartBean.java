package iuh.fit.demobai4.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartBean implements Serializable {
    private List<CartItemBean> items;

    public CartBean() {
        this.items = new ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }

    public void addBook(Book b) {
        for (CartItemBean item : items) {
            if (item.getBook().getId() == b.getId()) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }

        items.add(new CartItemBean(b, 1));
    }

    public void removeBook(long bookId) {
        items.removeIf(item -> item.getBook().getId() == bookId);
    }

    public double getTotal() {
        double total = 0;

        for (CartItemBean item : items) {
            total += item.getSubtotal();
        }

        return total;
    }
}
