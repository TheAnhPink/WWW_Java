package iuh.fit.demobai4.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Book implements Serializable {

    private long id;
    private String tittle;
    private String author;
    private double price;
    private String imgbook;
    private int quantity;
}
