package com.example.app_food_scan.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity(name = ProductAllergen.TABLE_NAME)
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ProductAllergen {

    public static final String TABLE_NAME = "PRODUCT_ALLERGEN";

    public static final String ID_PRODUCT_ALLERGEN_COLUMN = "ID_PRODUCT_ALLERGEN";
    public static final String ID_DEVICE_COLUMN = "ID_DEVICE";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = ID_PRODUCT_ALLERGEN_COLUMN, updatable = false, nullable = false)
    private Long idProductAllergen;

    @Column(name = ID_DEVICE_COLUMN)
    private String idDevice;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = Product.ID_PRODUCT_COLUMN)
    private Product product;

    @ManyToOne
    @JoinColumn(name = Allergen.ID_ALLERGEN_COLUMN)
    private Allergen allergen;

}
