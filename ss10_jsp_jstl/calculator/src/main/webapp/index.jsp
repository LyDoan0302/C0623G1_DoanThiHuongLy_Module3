<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Calculator</title>
</head>
<body>
<a href="/result.jsp">Result</a>
<h1>SIMPLE CALCULATOR</h1>
<form method="get" action="calculator-servlet">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <th>First operand:</th>
               <td> <input type="number" name="firstOperand" placeholder="Enter first operand:"></td>
            </tr>
            <tr>
                <th>Operator:</th>
                <td><input type="text" name="operator" placeholder="Enter operator:"></td>
            </tr>
            <tr>
                <th>Second operand:</th>
                <td><input type="number" name="secondOperand" placeholder="Enter second operand:"></td>
            </tr>
            <tr>
                <td><input type="submit" value="calculate"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>