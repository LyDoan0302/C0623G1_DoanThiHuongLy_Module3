package com.customer_manager.customer_manager.model.service;

import com.customer_manager.customer_manager.model.model.Customer;
import com.customer_manager.customer_manager.model.repository.CustomerRepositoryImpl;
import com.customer_manager.customer_manager.model.repository.ICustomerRepository;

import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    private final ICustomerRepository customerRepository = new CustomerRepositoryImpl();


    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerRepository.update(id, customer);
    }

    @Override
    public void remove(int id) {
        customerRepository.remove(id);
    }
}
