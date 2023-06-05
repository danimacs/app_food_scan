package com.example.app_food_scan.services;

import com.example.app_food_scan.models.ProductAllergenType;
import com.example.app_food_scan.repositories.ProductAllergenTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductAllergenTypeServiceImpl implements ProductAllergenTypeService {

    @Autowired
    ProductAllergenTypeRepository productAllergenTypeRepository;

    @Override
    public List<ProductAllergenType> getAll() {
        List<ProductAllergenType> productAllergenTypes = new ArrayList<>();
        productAllergenTypeRepository.findAll().forEach(productAllergenTypes::add);
        return productAllergenTypes;
    }
}
