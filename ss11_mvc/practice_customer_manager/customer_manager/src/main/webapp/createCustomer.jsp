<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/28/23
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Them moi khach hang</title>
</head>
<body>
<h1>Create new customer</h1>

<p>
  <a href="/?action=">Danh sach khach hang</a>
</p>
<form action="/?action=create" method="post">
  <fieldset>
    <legend>Them moi thong tin khach hang</legend>
    <table>
      <tr>
        <td>Ten khach hang</td>
        <td><input type="text" name="name" id="name"></td>
      </tr>
      <tr>
        <td>Email khach hang</td>
        <td><input type="text" name="email" id="email"></td>
      </tr>
      <tr>
        <td>Dia chi khach hang</td>
        <td><input type="text" name="address" id="address"></td>
      </tr>
      <tr><input type="submit" value="Them moi"/> </tr>
    </table>
  </fieldset>

</form>
</body>
</html>
