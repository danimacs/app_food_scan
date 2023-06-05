package com.example.app_food_scan.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity(name = Product.TABLE_NAME)
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Product {

    public static final String TABLE_NAME = "PRODUCT";

    public static final String ID_PRODUCT_COLUMN = "ID_PRODUCT";

    @Id
    @Column(name = ID_PRODUCT_COLUMN, updatable = false, nullable = false)
    private String idProduct;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private List<ProductAllergen> allergens;

    public Product(String idProduct) {
        this.idProduct = idProduct;
    }
}
