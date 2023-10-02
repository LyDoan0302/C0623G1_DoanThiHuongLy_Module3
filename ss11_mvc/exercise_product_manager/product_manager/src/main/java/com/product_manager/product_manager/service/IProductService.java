package com.product_manager.product_manager.service;

import com.product_manager.product_manager.model.Product;

import java.util.List;

public interface IProductService {
    //    Hiển thị danh sách sản phẩm
//    Tạo sản phẩm mới
//    Cập nhật thông tin sản phẩm
//    Xoá một sản phẩm
//    Xem chi tiết một sản phẩm
//    Tìm kiếm sản phẩm theo tên
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    Product findByName(String name);
}
