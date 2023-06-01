package com.example.app_food_scan.controllers;

import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/product")
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping({"/{idProduct}"})
    public ResponseEntity<Product> getTodo(@PathVariable String idProduct) {
        Product product = productService.getProduct(idProduct);
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

}
