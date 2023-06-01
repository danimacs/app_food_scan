package com.example.app_food_scan.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

@Entity(name = Allergen.TABLE_NAME)
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Allergen {

    public static final String TABLE_NAME = "ALLERGEN";

    public static final String ID_ALLERGEN_COLUMN = "ID_ALLERGEN";

    @Id
    @Column(name = ID_ALLERGEN_COLUMN, updatable = false, nullable = false)
    private String idAllergen;

}
