package com.example.app_food_scan.repositories;

import com.example.app_food_scan.models.Allergen;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AllergenRepository extends CrudRepository<Allergen, String> {

    @Query(value = "SELECT * FROM ALLERGEN ORDER BY ID_ALLERGEN", nativeQuery = true)
    List<Allergen> findAllOrderedById();

}