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
                        <td><input type="text" name="username" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pwd" id="pwd" size="40" required onInput="validatePwd()"></td>
                    </tr>
                    <tr>
                        <td>Password Confirmation</td>
                        <td><input type="password" name="pwdC" id="pwdC" size="40" required onInput="confirmPwd()"></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="first" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="last" size="40" required></td>
                    </tr>
                    <tr>
                        <td>email</td>
                        <td><input type="email" name="email" id="email" size="40" required onInput="validateEmail()"></td>
                    </tr>
                    <tr>
                        <td>Security Question</td>
                        <td><input type="text" name="username" size="40" required></td>
                    </tr>
                    <tr>
                        <td>Security Answer</td>
                        <td><input type="text" name="username" size="40" required></td>
                    </tr>
                    <tr>
                        <td><button>Register</button></td>
                    </tr>
                </thead>


            </table>

        </form>
    </body>
</html>
