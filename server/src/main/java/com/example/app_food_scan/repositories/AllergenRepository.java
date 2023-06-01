package com.example.app_food_scan.repositories;

import com.example.app_food_scan.models.Allergen;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AllergenRepository extends CrudRepository<Allergen, String> {
}