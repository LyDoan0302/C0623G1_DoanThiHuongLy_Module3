package com.product_manager.product_manager.repository;

import com.product_manager.product_manager.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository{
//    id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
    private static final Map<Integer, Product> productMapList;

    static {
        productMapList = new HashMap<>();
        productMapList.put(1,new Product(1,"but bi",10000,"muc tim","Thien Long"));
        productMapList.put(2,new Product(2,"but bi",10000,"muc xanh","Thien Long"));
        productMapList.put(3,new Product(3,"but nuoc",10000,"muc den","Hong Ha"));
        productMapList.put(4,new Product(4,"but muc",10000,"muc do","Thien Long"));
        productMapList.put(5,new Product(5,"but muc",10000,"muc den ","Thien Long"));
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMapList.values());
    }

    @Override
    public void save(Product product) {
        productMapList.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productMapList.get(id);
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {
        productMapList.remove(id);

    }
    @Override
    public Product findByName(String name) {
        return null;
    }
}
