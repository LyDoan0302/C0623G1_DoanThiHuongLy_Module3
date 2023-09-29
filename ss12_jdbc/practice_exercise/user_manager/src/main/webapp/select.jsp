<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/29/23
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select</title>
</head>
<body>
<p><a href="/?action=">User list</a></p>
<form method="get" action="/?action=select">
  <fieldset>
    <legend>
      User detail
    </legend>
    <table>
      <input type="hidden" name="id" value="${user.id}">
      <tr>
        <td>Name</td>
        <td><input type="text" name="name" value="${user.name}"></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><input type="text" name="email" value="${user.email}"></td>
      </tr>
      <tr>
        <td>Country</td>
        <td><input type="text" name="country" value="${user.country}"></td>
      </tr>
    </table>
  </fieldset>

</form>
</body>
</html>
