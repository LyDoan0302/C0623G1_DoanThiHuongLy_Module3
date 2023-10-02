package com.user_manager.user_manager.repository.impl;

import com.sun.imageio.plugins.jpeg.JPEGImageReaderResources;
import com.user_manager.user_manager.model.User;
import com.user_manager.user_manager.repository.IUserRepository;

import java.net.ConnectException;
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
    private static final String SELECT_USER_BY_ID_SP ="call find_user_by_id(?)";
    private static final String INSERT_USER_SQL_SP = "call insert_user_sp(?, ?, ?)";
    private static final String SELECT_ALL_USERS_SP = "call select_all_users_sp();";
    private static final String DELETE_USER_SP = "call delete_user_sp(?);";
    private static final String UPDATE_USER_SP = "call update_user_sp(?, ?, ?, ?)";
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
    public void insertUserSp(User user) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        CallableStatement call = connection.prepareCall(INSERT_USER_SQL_SP);
        call.setString(1, user.getName());
        call.setString(2, user.getEmail());
        call.setString(3, user.getCountry());
        call.executeUpdate();
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
    public User selectUserByIdSp(int id) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        User user = null;
        CallableStatement callableStatement = connection.prepareCall(SELECT_USER_BY_ID_SP);
        callableStatement.setInt(1, id);
        ResultSet resultSet = callableStatement.executeQuery();
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            user = new User(name, email, country);
        }
        return user;
    }
    @Override
    public List<User> selectAllUsers() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
//            Statement statement = connection.createStatement();
//            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USERS);
            CallableStatement call = connection.prepareCall(SELECT_ALL_USERS_SP);
            ResultSet resultSet = call.executeQuery();
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
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id)  {
        Connection connection = BaseRepository.getConnection();
        boolean rowDelete;
        try {
//            PreparedStatement pr = connection.prepareStatement(DELETE_USERS_SQL );
//            pr.setInt(1,id);
            CallableStatement callableStatement = connection.prepareCall(DELETE_USER_SP);
           callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate() > 0;
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
//            PreparedStatement pr = connection.prepareStatement(UPDATE_USERS_SQL);
//            pr.setString(1,user.getName());
//            pr.setString(2, user.getEmail());
//            pr.setString(3, user.getCountry());
//            pr.setInt(4, user.getId());
//            rowUpdate = pr.executeUpdate() > 0;
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USER_SP);
            callableStatement.setInt(1,user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowUpdate = callableStatement.executeUpdate() > 0;
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



    @Override
    public void addUserTransaction(User user, List<Integer> permissions) {
        Connection conn = null;
        PreparedStatement pr = null;
        PreparedStatement prAssignment = null;
        ResultSet rs = null;
        conn = BaseRepository.getConnection();
        try {
            conn.setAutoCommit(false);
            pr = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            pr.setString(1, user.getName());
            pr.setString(2, user.getEmail());
            pr.setString(3, user.getCountry());
            int rowAffected = pr.executeUpdate();
            int userId = 0;
            if (rowAffected == 1) {
                rs = pr.getGeneratedKeys();
                if (rs.next()) {
                    userId = rs.getInt(1);
                }
            }
            if (userId == 0) {
                throw new RuntimeException("Insert new user failed");
            }

//            rs = pr.getGeneratedKeys();

//            int userId = 0;
//            if(rs.next()) {
//                userId = rs.getInt(1);
//            }
            String sqlPivot = "insert into user_permission(user_id , permission_id)" + "values(?,?)";
            prAssignment = conn.prepareStatement(sqlPivot);

            for(int permissionId : permissions) {
                prAssignment.setInt(1, userId);
                prAssignment.setInt(2, permissionId);
//                if (permissionId == 2) {
//                    throw new RuntimeException("TEST");
//                }
                prAssignment.executeUpdate();
            }
            conn.commit();
        } catch (Exception e) {
                try {
                    if (conn != null) {
                        conn.rollback();
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            throw new RuntimeException(e);
        } finally {
            try{
                if(rs != null) {rs.close();}
                if(pr != null) {pr.close();}
                if(prAssignment != null) {prAssignment.close();}
                if(conn != null) {conn.close();}
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }
        }

    }

}
