package com.calculator.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");

        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("operator", operator);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
        String result;
        try {
            result = Calculator.calculate(firstOperand, secondOperand, operator) + "";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            result = e.getMessage();
        }

        request.setAttribute("result", result);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
