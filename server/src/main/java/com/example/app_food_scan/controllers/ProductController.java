package com.example.app_food_scan.controllers;

import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.services.ProductService;
import com.example.app_food_scan.services.data.AllergenTotals;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/product")
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping({"/{idProduct}"})
    public ResponseEntity<Product> getProduct(@PathVariable String idProduct) {
        Product product = productService.getProduct(idProduct);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @GetMapping(value = {"/{idProduct}/totals"}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<AllergenTotals>> getTotalByAllergen(@PathVariable String idProduct) {
        List<AllergenTotals> totalsByAllergen = productService.getTotalsByAllergen(idProduct);
        return new ResponseEntity<>(totalsByAllergen, HttpStatus.OK);
    }

    @PostMapping({"{idDevice}"})
    public ResponseEntity<Void> reportAllergens(@PathVariable String idDevice, @RequestBody Product product) {
        productService.reportAllergens(idDevice, product);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
