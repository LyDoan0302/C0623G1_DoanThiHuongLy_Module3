<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/28/23
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thong tin khach hang chi tiet</title>
</head>
<body>
<h1>Thong tin khach hang chi tiet</h1>
<p>
    <a href="/?action=">Danh sach khach hang</a>
</p>
<form href="/?action=view" method="get">
    <fieldset>
        <legend>Thong tin khach hang</legend>
        <table>
            <input type="hidden" name="id" value="${customer.id}">
            <tr>
                <td>Ten: </td>
                <td><input type="text" name="name" value="${customer.name}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" value="${customer.email}"></td>
            </tr>
            <tr>
                <td>Dia chi: </td>
                <td><input type="text" name="address" value="${customer.address}"></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
