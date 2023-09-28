<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Khach hang</title>
</head>
<body>
<h1>Danh sach khach hang</h1>
<c:if test="${mess != null}">${mess}</c:if>
<form action="/">
    <table border="1px">
        <thead>
        <th>Id</th>
        <th>Ten</th>
        <th>Email</th>
        <th>Dia chi</th>
        <th>Chuc nang</th>

        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td>
                <a href="/?action=edit&id=${customer.id}">Sua</a>
                <a href="/?action=delete&id=${customer.id}">Xoa</a>
                <a href="/?action=view&id=${customer.id}">Xem chi tiet</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<a href="/createCustomer.jsp">Them moi khach hang</a>
</body>
</html>