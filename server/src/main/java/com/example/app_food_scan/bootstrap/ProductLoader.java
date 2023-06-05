package com.example.app_food_scan.bootstrap;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.models.ProductAllergen;
import com.example.app_food_scan.models.ProductAllergenType;
import com.example.app_food_scan.repositories.AllergenRepository;
import com.example.app_food_scan.repositories.ProductRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ProductLoader implements CommandLineRunner {

    public final ProductRepository productRepository;
    public final AllergenRepository allergenRepository;

    public ProductLoader(ProductRepository productRepository, AllergenRepository allergenRepository) {
        this.productRepository = productRepository;
        this.allergenRepository = allergenRepository;
    }

    @Override
    public void run(String... args) {
        //loadProducts();
    }

    private void loadProducts() {
        if (productRepository.count() == 0) {
            Product product = new Product("8410300101642");

            ProductAllergen lupin = new ProductAllergen(null, "DEVICE_1", new ProductAllergenType(1L), product, new Allergen("en:lupin"));
            ProductAllergen peanuts = new ProductAllergen(null, "DEVICE_1", new ProductAllergenType(2L), product, new Allergen("en:peanuts"));
            product.setAllergens(List.of(lupin, peanuts));

            productRepository.save(product);

            System.out.println("Default Products Loaded");
        }
    }
}
