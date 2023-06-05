package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Allergen;

import java.util.List;

public interface AllergenService {

    List<Allergen> getAll();

    Allergen get(String idAllergen);
}
