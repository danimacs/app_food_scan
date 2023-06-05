package com.example.app_food_scan.bootstrap;

import com.example.app_food_scan.models.ProductAllergenType;
import com.example.app_food_scan.repositories.ProductAllergenTypeRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class ProductAllergenTypeLoader implements CommandLineRunner {
    public final ProductAllergenTypeRepository productAllergenTypeRepository;

    public ProductAllergenTypeLoader(ProductAllergenTypeRepository productAllergenTypeRepository) {
        this.productAllergenTypeRepository = productAllergenTypeRepository;
    }

    @Override
    public void run(String... args) {
        loadAllergens();
    }

    private void loadAllergens() {
        if (productAllergenTypeRepository.count() == 0) {
            productAllergenTypeRepository.save(new ProductAllergenType(1L, "Sí"));
            productAllergenTypeRepository.save(new ProductAllergenType(2L, "No"));
            productAllergenTypeRepository.save(new ProductAllergenType(3L, "Ns"));

            System.out.println("Default ProductAllergenType Loaded");
        }
    }
}
