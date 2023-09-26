package com.login.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RequestDispatcher requestDispatcher =
                request.getRequestDispatcher("/login.jsp");
        request.setAttribute("username",username);

        RequestDispatcher requestDispatcher1 =
                request.getRequestDispatcher("/login.jsp");
        request.setAttribute("password",password);
        requestDispatcher.forward(request,response);


    }
}
