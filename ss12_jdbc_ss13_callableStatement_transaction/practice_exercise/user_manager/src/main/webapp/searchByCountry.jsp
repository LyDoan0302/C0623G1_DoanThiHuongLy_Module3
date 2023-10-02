<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/29/23
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search By Country</title>
</head>
<body>
<table border="1px">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Function</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/?action=select&id=${user.id}">User detail</a></td>
            <td><a href="/?action=delete&id=${user.id}">Delete</a></td>
            <td><a href="/?action=edit&id=${user.id}">Update</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
