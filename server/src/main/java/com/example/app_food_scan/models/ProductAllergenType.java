package com.example.app_food_scan.models;

import jakarta.persistence.*;
import lombok.*;

@Entity(name = ProductAllergenType.TABLE_NAME)
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ProductAllergenType {

    public static final String TABLE_NAME = "PRODUCT_ALLERGEN_TYPE";

    public static final String ID_PRODUCT_ALLERGEN_TYPE_COLUMN = "ID_PRODUCT_ALLERGEN_TYPE";
    public static final String NAME_COLUMN = "NAME";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = ID_PRODUCT_ALLERGEN_TYPE_COLUMN, updatable = false, nullable = false)
    private Long idProductAllergenType;

    @Column(name = NAME_COLUMN)
    private String name;

    public ProductAllergenType(Long idProductAllergenType) {
        this.idProductAllergenType = idProductAllergenType;
    }
}
