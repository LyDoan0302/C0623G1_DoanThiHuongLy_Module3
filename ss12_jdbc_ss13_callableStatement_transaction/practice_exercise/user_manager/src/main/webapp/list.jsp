<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - USER</title>
</head>
<h1>List of User</h1>

<form method="post" action="/?action=search">
    <div style="margin: 10px">
        <input type="text" name="country" placeholder="Enter country name" size="30">
        <input type="submit" value="Search">
    </div>
</form>

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
<p><a href="/?action=insert">Create a new user</a></p>
<p><a href="/?action=sort">Sort users by name</a></p>
<c:if test="${mess != null}">${mess}</c:if>
</body>
</html>