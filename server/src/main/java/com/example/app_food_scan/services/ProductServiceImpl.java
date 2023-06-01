package com.example.app_food_scan.services;

import com.example.app_food_scan.models.Product;
import com.example.app_food_scan.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;

    @Override
    public Product getProduct(String idProduct) {
        if (productRepository.existsById(idProduct)) {
            return _get(idProduct);
        }
        return _create(idProduct);
    }

    private Product _get(String idProduct) {
        return productRepository.findById(idProduct).get();
    }

    private Product _create(String idProduct) {
        Product product = new Product();
        product.setIdProduct(idProduct);
        return productRepository.save(product);
    }
}
