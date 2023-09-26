<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/26/23
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <style>
        td{
            padding: 10px;
        }
    </style>
</head>
<body>
<table>
    <tbody>
    <tr>
        <td>Product Description:</td>
        <td>${description} </td>
    </tr>
    <tr>
        <td>List Price:</td>
        <td>${price} </td>
    </tr>
    <tr>
        <td>Discount Percent:</td>
        <td>${discountPercent}</td>
    </tr>
    <tr>
        <td>Discount Amount:</td>
        <td>${discountAmount}</td>
    </tr>
    <tr>
        <td>Discount Price:</td>
        <td>${discountPrice }</td>
    </tr>
    </tbody>
</table>
</body>
</html>
