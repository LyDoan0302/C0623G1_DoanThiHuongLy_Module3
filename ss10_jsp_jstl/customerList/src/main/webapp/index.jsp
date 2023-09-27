<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Customer</title>
</head>
<body>
<table border="1px">
    <thead style="text-align: center" >
    <tr>
        <th>STT</th>
        <th>Ten</th>
        <th>Ngay sinh</th>
        <th>Dia chi</th>
        <th>Hinh anh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${customer.name}</td>
            <td>${customer.birth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.image}" style="width: 100px " height="auto" ></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>