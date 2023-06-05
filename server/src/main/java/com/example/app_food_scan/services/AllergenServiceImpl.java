package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.repositories.AllergenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AllergenServiceImpl implements AllergenService {

    @Autowired
    AllergenRepository allergenRepository;

    @Override
    public List<Allergen> getAll() {
        return new ArrayList<>(allergenRepository.findAllOrderedById());
    }

    @Override
    public Allergen get(String idAllergen) {
        return allergenRepository.findById(idAllergen).get();
    }
}
