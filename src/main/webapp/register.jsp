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
        <form name="register" action="RegistrationFormAction.jsp" method="get">
            <table border="1">
                <thead>
                    <tr>
                        <td>UserName</td>
                        <td><input type="text" name="Username" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="Email" size="40" id="Email" required onInput="validateEmail()"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="Password" id="pwd" size="40" required onInput="validatePwd()"></td>
                    </tr>
                    <tr>
                        <td>Password Confirmation</td>
                        <td><input type="password" name="PasswordC" id="pwdC" size="40" required onInput="confirmPwd()"></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="FirstName" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="LastName" size="40" required></td>
                    </tr>
                    <tr>
                        <td>bio</td>
                        <td><input type="text" name="Bio" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Security Question</td>
                        <td><input type="text" name="SecurityQ" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Security Answer</td>
                        <td><input type="text" name="SecurityA" size="40" required></td>
                    </tr>
                    <tr>
                        <td><button>Register</button></td>
                    </tr>
                </thead>


            </table>

        </form>
    </body>
</html>
