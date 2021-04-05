<%-- 
    Document   : register
    Created on : Mar 17, 2021, 7:54:26 PM
    Author     : snam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="jumbotron text-center">
            <h1>Registration Form</h1>
            </div>
        <form name="register" action="RegistrationFormAction.jsp" method="get">
            <div class="form-group">
                <label for="UserName">Username:</label>
                <input type="text" class="form-control" name="Username" size="40" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" name="Email" size="40" id="email" required onInput="validateEmail()">
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="password" class="form-control" name="Password" id="pwd" size="40" required onInput="validatePwd()">
            </div>
            <div class="form-group">
                <label for="PasswordC">Password Confirmation:</label>
                <input type="password" class="form-control" name="PasswordC" id="pwdC" size="40" required onInput="confirmPwd()">
            </div>
            <div class="form-group">
                <label for="FirstName">First Name:</label>
                <input type="text" class="form-control" name="FirstName" size="40" required>
            </div>
            <div class="form-group">
                <label for="LastName">Last Name:</label>
                <input type="text" class="form-control" name="LastName" size="40" required>
            </div>
            <div class="form-group">
                <label for="Bio">Bio:</label>
                <input type="text" class="form-control" name="Bio" size="40" required>
            </div>
            <div class="form-group">
                <label for="SecurityQ">Security Question:</label>
                <input type="text" class="form-control" name="SecurityQ" size="40" required>
            </div>
            <div class="form-group">
                <label for="SecurityA">Security Answer:</label>
                <input type="text" class="form-control" name="SecurityA" size="40" required>
            </div>
                <button type="submit" class="btn btn-primary">Register</button>
                </form>
            </div>
        
        
        <%@include file="footer.jsp" %>
    </body>
</html>
