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
            allergenRepository.save(new Allergen("en:lupin"));
            allergenRepository.save(new Allergen("en:peanuts"));
            allergenRepository.save(new Allergen("en:sulphur-dioxide-and-sulphites"));
            allergenRepository.save(new Allergen("en:milk"));
            allergenRepository.save(new Allergen("en:crustaceans"));
            allergenRepository.save(new Allergen("en:molluscs"));
            allergenRepository.save(new Allergen("en:eggs"));
            allergenRepository.save(new Allergen("en:gluten"));
            allergenRepository.save(new Allergen("en:soybeans"));
            allergenRepository.save(new Allergen("en:fish"));
            allergenRepository.save(new Allergen("en:mustard"));
            allergenRepository.save(new Allergen("en:sesame-seeds"));
            allergenRepository.save(new Allergen("en:celery"));
            allergenRepository.save(new Allergen("en:none"));
            allergenRepository.save(new Allergen("en:nuts"));

            System.out.println("Default Allergens Loaded");
        }
    }
}
