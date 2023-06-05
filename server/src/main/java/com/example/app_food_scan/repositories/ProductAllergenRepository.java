package com.example.app_food_scan.repositories;

import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.models.ProductAllergen;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductAllergenRepository extends CrudRepository<ProductAllergen, Long> {

    List<ProductAllergen> findByIdDeviceAndProduct(String idDevice, Product product);

    @Query(value = "SELECT a.ID_ALLERGEN, t.ID_PRODUCT_ALLERGEN_TYPE, COALESCE(cnt, 0) AS count " +
            "FROM ALLERGEN a " +
            "CROSS JOIN PRODUCT_ALLERGEN_TYPE t " +
            "LEFT JOIN ( " +
            "   SELECT pa.ID_ALLERGEN, pa.ID_PRODUCT_ALLERGEN_TYPE, COUNT(*) AS cnt " +
            "   FROM PRODUCT_ALLERGEN pa " +
            "   WHERE pa.ID_PRODUCT = :idProduct " +
            "   GROUP BY pa.ID_ALLERGEN, pa.ID_PRODUCT_ALLERGEN_TYPE " +
            ") p ON p.ID_ALLERGEN = a.ID_ALLERGEN AND p.ID_PRODUCT_ALLERGEN_TYPE = t.ID_PRODUCT_ALLERGEN_TYPE " +
            "ORDER BY a.ID_ALLERGEN, t.ID_PRODUCT_ALLERGEN_TYPE", nativeQuery = true)
    List<Object[]> findTotalsByAllergen(@Param("idProduct") String idProduct);

}