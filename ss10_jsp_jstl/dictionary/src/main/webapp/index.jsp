<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Dictionary</title>
</head>
<body>
<h1>Vietnamese Dictionary
</h1>
<br/>
<form action="dictionary-servlet" method="get">
    <input type="text" name="search" placeholder="Enter your word: ">
    <input type="submit" value="Search">
</form>
<c:if test="${result !=null}">
    <c:out value="English: ${search};"></c:out>
    <c:out value="Vietnamese: ${result};"></c:out>
</c:if>
<c:if test="${result == null}">
    <c:out value="Khong tim thay du lieu"></c:out>
</c:if>
</body>
</html>