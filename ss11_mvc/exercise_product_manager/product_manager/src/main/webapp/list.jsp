<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Danh sach san pham</h1>
<c:if test="${mess != null}">${mess}</c:if>
<form action="/">
    <table border="1px">
        <thead>
        <th>Id</th>
        <th>Ten</th>
        <th>Gia</th>
        <th>Mo ta san pham</th>
        <th>Nha san xuat</th>
        <th>Chuc nang</th>

        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.producer}</td>
                <td>
                    <a href="/?action=edit&id=${product.id}">Sua</a>
                    <a href="/?action=delete&id=${product.id}">Xoa</a>
                    <a href="/?action=view&id=${product.id}">Xem chi tiet</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<a href="/create.jsp">Them moi san pham</a>
</body>
</html>