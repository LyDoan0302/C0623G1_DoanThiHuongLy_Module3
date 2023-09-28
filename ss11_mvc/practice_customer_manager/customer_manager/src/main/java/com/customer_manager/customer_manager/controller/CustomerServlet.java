package com.customer_manager.customer_manager.controller;

import com.customer_manager.customer_manager.model.model.Customer;
import com.customer_manager.customer_manager.model.service.CustomerServiceImpl;
import com.customer_manager.customer_manager.model.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }

    }

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer",customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/viewCustomer.jsp");
        try{
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException i) {
            i.printStackTrace();
        }

    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/deleteCustomer.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException i) {
            i.printStackTrace();
        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("createCustomer.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException i) {
            i.printStackTrace();
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("editCustomer.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException i) {
            i.printStackTrace();
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/listCustomer.jsp");

        try{
            requestDispatcher.forward(request, response);
        } catch(ServletException e) {
            e.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit" :
                editCustomer(request,response);
                break;
            case "delete" :
                deleteCustomer(request,response);
                break;
            default:
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)  {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        customerService.remove(id);

        String mess="Da xoa thong tin khach hang thanh cong";
        request.setAttribute("mess",mess);

        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/listCustomer.jsp");
        try{
            requestDispatcher.forward(request, response);
        } catch(ServletException e) {
            e.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = customerService.findById(id);

        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        customerService.update(id, customer);
        String mess = "Da sua thong tin khach hang thanh cong!";

        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        request.setAttribute("mess", mess);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/listCustomer.jsp");

        try{
            requestDispatcher.forward(request, response);
        } catch(ServletException e) {
            e.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random() * 10000);

        Customer customer = new Customer(id, name, email, address);
        this.customerService.save(customer);
        String mess = "Da them moi thong tin khach hang!";

        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        request.setAttribute("mess", mess);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/listCustomer.jsp");

        try{
            requestDispatcher.forward(request, response);
        } catch(ServletException e) {
            e.printStackTrace();
        } catch (IOException ie) {
            ie.printStackTrace();
        }

    }
}
