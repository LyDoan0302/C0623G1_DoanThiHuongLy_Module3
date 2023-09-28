<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/28/23
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<h1>Them moi san pharm</h1>

<p>
    <a href="/?action=">Danh sach san pham</a>
</p>
<form action="/?action=create" method="post">
    <fieldset>
        <legend>Them moi thong tin san pham</legend>
        <table>
            <tr>
                <td>Ten san phamr</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Gia </td>
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Mo ta san pharm</td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td>Nha san xuat</td>
                <td><input type="text" name="producer" id="producer"></td>
            </tr>
            <tr><input type="submit" value="Them moi"/> </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
