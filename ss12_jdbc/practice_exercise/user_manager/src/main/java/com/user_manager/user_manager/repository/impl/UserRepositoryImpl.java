package com.user_manager.user_manager.repository.impl;

import com.user_manager.user_manager.model.User;
import com.user_manager.user_manager.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserRepositoryImpl implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SORT_USERS_BY_NAME = "select id, name, email, country \n" +
            "from users\n" +
            "order by name;";
    private  static final String SEARCH_USERS_BY_COUNTRY = "select id, name, email, country\n" +
            "from users\n" +
            "where country = ?";
    @Override
    public void insertUser(User user){
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement  pr = connection.prepareStatement(INSERT_USERS_SQL );
            pr.setString(1, user.getName());
            pr.setString(2, user.getEmail());
            pr.setString(3, user.getCountry());
            pr.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public User selectUser(int id) {
        Connection connection = BaseRepository.getConnection();
        User user = null;
        try {
            PreparedStatement pr = connection.prepareStatement(SELECT_USER_BY_ID);
            pr.setInt(1,id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USERS);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id)  {
        Connection connection = BaseRepository.getConnection();
        boolean rowDelete;
        try {
            PreparedStatement pr = connection.prepareStatement(DELETE_USERS_SQL );
            pr.setInt(1,id);
            rowDelete = pr.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) {
        Connection connection = BaseRepository.getConnection();
        boolean rowUpdate;
        try {
            PreparedStatement pr = connection.prepareStatement(UPDATE_USERS_SQL);
            pr.setString(1,user.getName());
            pr.setString(2, user.getEmail());
            pr.setString(3, user.getCountry());
            pr.setInt(4, user.getId());
            rowUpdate = pr.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    @Override
    public List<User> sortUserByName() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SORT_USERS_BY_NAME);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;

    }

    @Override
    public List<User> searchByCountry(String country) {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement pr = connection.prepareStatement(SEARCH_USERS_BY_COUNTRY);
            pr.setString(1,country);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
//                country = resultSet.getString("country");
                userList.add(new User(name,email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

}
