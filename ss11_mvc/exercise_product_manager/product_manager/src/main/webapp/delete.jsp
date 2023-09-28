<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/28/23
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Xoa</title>
</head>
<body>
<p>
  <a href="/?action=">Danh sach san pham</a>
</p>
<form method="post" action="/?action=delete">
  <fieldset>
    <legend>Thong tin san pham</legend>
    <table>
      <input type="hidden" name="id" value="${product.id}">
      <tr>
        <td>Ten san pham </td>
        <td><input type="text" name="name" value="${product.name}"></td>
      </tr>
      <tr>
        <td>Gia  </td>
        <td><input type="number" name="price" value="${product.price}"></td>
      </tr>
      <tr>
        <td>Mo ta san pham</td>
        <td><input type="text" name="description" value="${product.description}"></td>
      </tr>
      <tr>
        <td>Nha san xuat</td>
        <td><input type="text" name="producer" value="${product.producer}"></td>
      </tr>
      <tr><input type="submit" value="Xac nhan"></tr>
    </table>

  </fieldset>
</form>
</body>
</html>
