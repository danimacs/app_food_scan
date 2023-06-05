package com.example.app_food_scan.repositories;

import com.example.app_food_scan.models.ProductAllergenType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductAllergenTypeRepository extends CrudRepository<ProductAllergenType, Long> {
}