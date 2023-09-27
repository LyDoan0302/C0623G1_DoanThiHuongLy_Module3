package com.customer.customerlist;

import com.customer.customerlist.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Van Hoang", "01/01/2000","Da Nang",
                "https://cdn-icons-png.flaticon.com/512/3557/3557479.png"));
        customerList.add(new Customer("Nguyen Thi Nu", "01/02/2000","Da Nang",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBIWyS2yOyyfZvxspUrO1A5zIiZmGFwmWQBgBGsROTl7NrnMHZAevcIu_JITdUx5xcuNM&usqp=CAU"));
        customerList.add(new Customer("Hoang Thi Ly", "02/11/2000","Kon Tum",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1lVZb2VcsL_8SbY3I6JLNkl6ioD6cg5RWvL4iUYu9quQuS-CSlAkHxy_zDzeJz_5l6Yw&usqp=CAU"));
        customerList.add(new Customer("Nguyen Van Nam", "01/01/1999","Da Nang",
                "https://creazilla-store.fra1.digitaloceanspaces.com/icons/7913955/business-man-icon-md.png"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher =
                request.getRequestDispatcher("/index.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
