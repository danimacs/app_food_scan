package com.example.app_food_scan.services.data;

import com.example.app_food_scan.models.ProductAllergenType;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class TypeTotal {
    private ProductAllergenType type;
    private Long total;
}
