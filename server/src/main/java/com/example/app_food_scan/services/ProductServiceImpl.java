package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Allergen;
import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.models.ProductAllergen;
import com.example.app_food_scan.models.ProductAllergenType;
import com.example.app_food_scan.repositories.AllergenRepository;
import com.example.app_food_scan.repositories.ProductAllergenRepository;
import com.example.app_food_scan.repositories.ProductAllergenTypeRepository;
import com.example.app_food_scan.repositories.ProductRepository;
import com.example.app_food_scan.services.data.AllergenTotals;
import com.example.app_food_scan.services.data.TypeTotal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductAllergenRepository productAllergenRepository;
    @Autowired
    ProductAllergenTypeRepository productAllergenTypeRepository;
    @Autowired
    AllergenRepository allergenRepository;


    @Override
    public void reportAllergens(String idDevice, Product product) {
        // Eliminar reportes actuales
        List<ProductAllergen> existingProductAllergens = productAllergenRepository.findByIdDeviceAndProduct(idDevice, product);
        for (ProductAllergen existingProductAllergen : existingProductAllergens) {
            productAllergenRepository.deleteById(existingProductAllergen.getIdProductAllergen());
        }

        // Añadir la entidad padre en los hijos
        for (ProductAllergen allergen : product.getAllergens()) {
            allergen.setProduct(product);
        }

        productRepository.save(product);
    }

    @Override
    public List<AllergenTotals> getTotalsByAllergen(String idProduct) {
        List<Object[]> results = productAllergenRepository.findTotalsByAllergen(idProduct);

        Map<Allergen, AllergenTotals> allergenTotalsMap = new LinkedHashMap<>();

        for (Object[] row : results) {
            Allergen allergen = allergenRepository.findById((String) row[0]).orElse(null);
            ProductAllergenType type = productAllergenTypeRepository.findById((Long) row[1]).orElse(null);
            Long total = (Long) row[2];

            if (allergen != null && type != null) {
                AllergenTotals allergenTotals = allergenTotalsMap.getOrDefault(allergen, new AllergenTotals());
                allergenTotals.setAllergen(allergen);

                List<TypeTotal> typeTotals = allergenTotals.getTypeTotals();
                if (typeTotals == null) {
                    typeTotals = new ArrayList<>();
                }
                TypeTotal typeTotal = new TypeTotal(type, total);
                typeTotals.add(typeTotal);

                allergenTotals.setTypeTotals(typeTotals);
                allergenTotalsMap.put(allergen, allergenTotals);
            }
        }

        return new ArrayList<>(allergenTotalsMap.values());
    }

    @Override
    public Product getProduct(String idProduct) {
        return productRepository.findById(idProduct).get();
    }
}

