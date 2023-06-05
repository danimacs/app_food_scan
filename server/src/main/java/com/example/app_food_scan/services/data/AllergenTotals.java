package com.example.app_food_scan.services.data;

import com.example.app_food_scan.models.Allergen;
import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AllergenTotals {
    private Allergen allergen;
    private List<TypeTotal> typeTotals;
}
