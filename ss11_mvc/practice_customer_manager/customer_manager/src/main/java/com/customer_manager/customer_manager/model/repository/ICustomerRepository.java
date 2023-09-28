package com.customer_manager.customer_manager.model.repository;

import com.customer_manager.customer_manager.model.model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerRepository {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id);
}
