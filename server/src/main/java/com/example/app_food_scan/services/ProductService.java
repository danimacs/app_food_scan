package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.services.data.AllergenTotals;

import java.util.List;

public interface ProductService {

    void reportAllergens(String idDevice, Product product);

    List<AllergenTotals> getTotalsByAllergen(String idProduct);

    Product getProduct(String idProduct);

}
