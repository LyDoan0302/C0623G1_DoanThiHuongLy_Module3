package com.user_manager.user_manager.controller;

import com.user_manager.user_manager.model.User;
import com.user_manager.user_manager.service.IUserService;
import com.user_manager.user_manager.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "")
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "create" :
                break;
            case "select" :
                selectUser(request,response);
                break;
            case "insert" :
                insertForm(request,response);
                break;
            case "delete" :
                deleteForm(request,response);
                break;
            case "edit" :
                editForm(request,response);
                break;
            case "sort" :
                sortForm(request, response);
                break;
            default:
                showList(request,response);
                break;
        }

    }


    private void sortForm(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("sort.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("delete.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("insert.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void selectUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("select.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null? "": action;
        switch (action) {
            case "insert":
                insertUser(request,response);
                break;
            case "delete" :
                deleteUser(request,response);
                break;
            case "edit" :
                editUser(request,response);
                break;
            case "search" :
                searchByCountry(request,response);
                break;
            default:
                break;
        }

    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        try {
            userService.updateUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String mess = "Updated successfully!";
        request.setAttribute("mess", mess);
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        try {
            userService.deleteUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String mess = "Deleted successfully!";
        request.setAttribute("mess",mess);
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 1000);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        try {
            this.userService.insertUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String mess ="Created successfully!";
        request.setAttribute("user",user);
        request.setAttribute("mess",mess);
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = null;
        try {
            userList = userService.searchByCountry(country);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("searchByCountry.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
