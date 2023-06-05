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
    public static final String ID_PRODUCT_ALLERGEN_TYPE_COLUMN = "ID_PRODUCT_ALLERGEN_TYPE";
    public static final String ID_PRODUCT_COLUMN = "ID_PRODUCT";
    public static final String ID_ALLERGEN_COLUMN = "ID_ALLERGEN";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = ID_PRODUCT_ALLERGEN_COLUMN, updatable = false, nullable = false)
    private Long idProductAllergen;

    @Column(name = ID_DEVICE_COLUMN)
    private String idDevice;

    @ManyToOne
    @JoinColumn(name = ID_PRODUCT_ALLERGEN_TYPE_COLUMN)
    private ProductAllergenType productAllergenType;

    @ManyToOne
    @JoinColumn(name = ID_PRODUCT_COLUMN)
    @JsonIgnore
    private Product product;

    @ManyToOne
    @JoinColumn(name = ID_ALLERGEN_COLUMN)
    private Allergen allergen;

}
