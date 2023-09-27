package com.dictionary;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", value = "/dictionary-servlet")
public class DictionaryServlet extends HttpServlet {
    private static Map<String, String> dic;
    static {
        dic = new HashMap<>();
        dic.put("hello", "Xin chào");
        dic.put("how", "Thế nào");
        dic.put("book", "Quyển vở");
        dic.put("computer", "Máy tính");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String result = dic.get(search);
        RequestDispatcher requestDispatcher =
                request.getRequestDispatcher("/index.jsp");
        request.setAttribute("search",search);
        request.setAttribute("result", result);

        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
