<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/29/23
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sort by name</title>
</head>
<body>
<h1>List of User sorted by name</h1>
<a href="/?action=">User List</a>

<table border="1px">
  <thead>
  <tr>
    <th>STT</th>
    <th>Name</th>
    <th>Email</th>
    <th>Country</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="user" items="${userList}" varStatus="loop">
    <tr>
      <td>${loop.count}</td>
      <td>${user.name}</td>
      <td>${user.email}</td>
      <td>${user.country}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
