
<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/28/23
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sua</title>
</head>
<body>
<p>
    <a href="/?action=">Danh sach khach hang</a>
</p>
<form method="post" action="/?action=edit">
    <fieldset>
        <legend>Thong tin khach hang</legend>
        <table>
            <input type="hidden" name="id" value="${customer.id}">
            <tr>
                <td>Ten: </td>
                <td><input type="text" name="name" id="name" value="${customer.name}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${customer.email}"></td>
            </tr>
            <tr>
                <td>Dia chi: </td>
                <td><input type="text" name="address" id="address" value="${customer.address}"></td>
            </tr>
            <tr><input type="submit" value="Xac nhan"></tr>
        </table>
    </fieldset>

</form>

</body>
</html>
