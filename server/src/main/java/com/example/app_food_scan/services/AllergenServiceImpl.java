package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.repositories.AllergenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AllergenServiceImpl implements AllergenService {

    @Autowired
    AllergenRepository allergenRepository;

    private Allergen _get(String idAllergen) {
        return allergenRepository.findById(idAllergen).get();
    }
}
