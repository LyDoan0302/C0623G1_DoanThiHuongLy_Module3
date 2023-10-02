<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/29/23
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h3>Delete User</h3>
<form action="/?action=delete" method="post">
    <fieldset>
        <legend>User detail</legend>
        <table>
            <tr>
                <input type="hidden" name="id" value="${user.id}">
            </tr>
            <tr>
                <td>Name </td>
                <td><input type="text" name="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td>Email </td>
                <td><input type="text" name="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td>Country </td>
                <td><input type="text" name="country" value="${user.country}"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
