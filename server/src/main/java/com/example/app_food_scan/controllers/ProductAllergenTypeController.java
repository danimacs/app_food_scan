package com.example.app_food_scan.controllers;

import com.example.app_food_scan.models.ProductAllergenType;
import com.example.app_food_scan.services.ProductAllergenTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/product-allergen-type")
public class ProductAllergenTypeController {

    @Autowired
    ProductAllergenTypeService productAllergenTypeService;

    @GetMapping()
    public ResponseEntity<List<ProductAllergenType>> getProductAllergenTypes() {
        List<ProductAllergenType> productAllergenTypes = productAllergenTypeService.getAll();
        return new ResponseEntity<>(productAllergenTypes, HttpStatus.OK);
    }

}
