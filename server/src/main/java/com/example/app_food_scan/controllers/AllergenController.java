package com.example.app_food_scan.controllers;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.services.AllergenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/allergen")
public class AllergenController {

    @Autowired
    AllergenService productService;

    @GetMapping()
    public ResponseEntity<List<Allergen>> getAllergens() {
        List<Allergen> allergens = productService.getAll();
        return new ResponseEntity<>(allergens, HttpStatus.OK);
    }

    @GetMapping({"/{idAllergen}"})
    public ResponseEntity<Allergen> getAllergen(@PathVariable String idAllergen) {
        Allergen allergens = productService.get(idAllergen);
        return new ResponseEntity<>(allergens, HttpStatus.OK);
    }

}
