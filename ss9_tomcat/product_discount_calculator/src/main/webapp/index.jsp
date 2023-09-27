<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Product Discount Calculator</title>
    <style>
        form{
            padding: 10px;
        }
        label{
            font-size: larger;
            padding: 10px;
            margin-bottom: 10px;
        }
        input{
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>

</head>
<body>
<h1>Product detail</h1>

<form method="post" action="calculator-servlet">
    <label for="description">Product Description:</label><br>
    <input type="text" name="description" id="description" size="30"><br>

    <label for="price">List Price:</label><br>
    <input type="number" name="price" id="price" size="30"><br>

    <label for="discountPercent">Discount Percent:</label><br>
    <input type="number" name="discountPercent" id="discountPercent"><br>

    <input type="submit" value="Calculate Discount">

</form>
</body>
</html>