<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 9/29/23
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert</title>
</head>
<body>
<p><a href="/?action=">User List</a></p>
<form method="post" action="/?action=insert">
    <fieldset>
        <legend>Creat User</legend>
        <table>
            <tr>
                <td>User name:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>User email:</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>User country:</td>
                <td><input type="text" name="country" id="country"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>

</form>

</body>
</html>
