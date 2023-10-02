package com.product_manager.product_manager.service;

import com.product_manager.product_manager.model.Product;
import com.product_manager.product_manager.repository.IProductRepository;
import com.product_manager.product_manager.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService{
    private final IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);

    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);

    }

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }
}
