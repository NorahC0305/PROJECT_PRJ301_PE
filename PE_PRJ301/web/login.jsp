<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Username <input type="text" name="txtUsername" value="" /> <br/>
            Password <input type="password" name="txtPassword" value="" /> <br/>
            <input type="submit" value="Login" name="action" />
            <input type="reset" value="Reset" /> <br/><br/>
    </body>

</html>

