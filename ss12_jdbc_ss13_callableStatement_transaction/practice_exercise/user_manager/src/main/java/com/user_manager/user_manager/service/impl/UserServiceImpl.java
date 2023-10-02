package com.user_manager.user_manager.service.impl;

import com.user_manager.user_manager.model.User;
import com.user_manager.user_manager.repository.IUserRepository;
import com.user_manager.user_manager.repository.impl.UserRepositoryImpl;
import com.user_manager.user_manager.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private static final IUserRepository userRepository = new UserRepositoryImpl();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public void insertUserSp(User user) throws SQLException {
        userRepository.insertUserSp(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> sortUserByName() throws SQLException {
        return userRepository.sortUserByName();
    }

    @Override
    public List<User> searchByCountry(String country) throws SQLException {
        return userRepository.searchByCountry(country);
    }

    @Override
    public User selectUserByIdSp(int id) throws SQLException {
        return userRepository.selectUserByIdSp(id);
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permissions) throws SQLException {
        userRepository.addUserTransaction(user, permissions);
    }
}
