<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="currency-convert-servlet" method="post">
    <label for="rate" >Rate: </label>
    <input type="text" id="rate" name="rate" placeholder="Rate" value="22000"/></br>
    <label for="usd">USD: </label>
    <input type="text" id="usd" name="usd" placeholder="USD" value=""/></br>
    <input type="submit" id="submit" value="Converter"/>
</form>
<p>VND: ${vnd} </p>
</body>
</html>