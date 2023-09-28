package com.product_manager.product_manager.model.repository;

import com.product_manager.product_manager.model.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    Product findByName(String name);
}
