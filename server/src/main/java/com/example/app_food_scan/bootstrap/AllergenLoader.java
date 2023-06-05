package com.example.app_food_scan.bootstrap;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.repositories.AllergenRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class AllergenLoader implements CommandLineRunner {
    public final AllergenRepository allergenRepository;

    public AllergenLoader(AllergenRepository allergenRepository) {
        this.allergenRepository = allergenRepository;
    }

    @Override
    public void run(String... args) {
        loadAllergens();
    }

    private void loadAllergens() {
        if (allergenRepository.count() == 0) {
            allergenRepository.save(new Allergen("en:lupin", "Altramuz"));
            allergenRepository.save(new Allergen("en:peanuts", "Cacahuetes"));
            allergenRepository.save(new Allergen("en:sulphur-dioxide-and-sulphites", "Dióxido de azufre"));
            allergenRepository.save(new Allergen("en:milk", "Leche"));
            allergenRepository.save(new Allergen("en:crustaceans", "Crustáceos"));
            allergenRepository.save(new Allergen("en:molluscs", "Moluscos"));
            allergenRepository.save(new Allergen("en:eggs", "Huevos"));
            allergenRepository.save(new Allergen("en:gluten", "Gluten"));
            allergenRepository.save(new Allergen("en:soybeans", "Soja"));
            allergenRepository.save(new Allergen("en:fish", "Pescado"));
            allergenRepository.save(new Allergen("en:mustard", "Mostaza"));
            allergenRepository.save(new Allergen("en:sesame-seeds", "Semillas de sésamo"));
            allergenRepository.save(new Allergen("en:celery", "Apio"));
            allergenRepository.save(new Allergen("en:none", "Ninguno"));
            allergenRepository.save(new Allergen("en:nuts", "Frutos secos"));


            System.out.println("Default Allergens Loaded");
        }
    }
}
