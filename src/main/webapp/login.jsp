<%-- 
    Document   : login
    Created on : Mar 20, 2021, 1:12:57 AM
    Author     : dhague
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
                <h1>Calendar App - Log In</h1>
            </div>
            <div class="container">
                <div class="d-flex justify-content-center">
                    <form action="loginAction.jsp">
                        <div class="form-group row">
                            <div class="">
                                <input type="text" class="form-control" name="userName" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="">
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="">
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </div>
                            <span>
                                <a href="/Sprint1/forgotPassword.jsp">
                                    <button type="button" class="btn btn-link">
                                        Forgot Password
                                    </button>
                                </a>
                            </span>
                        </div>
                        <div id="invalid">
                            <div class="alert alert-warning" id="message" role="alert">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            invalidMessageDiv = document.getElementById("invalid");
            message = "${message}";
            console.log(message);
            console.log(invalidMessageDiv);
            console.log("${creds}");
            if (message === "") {
                console.log("There's no message");
                invalidMessageDiv.hidden = true;
            } else {
                console.log("There was a message");
                document.getElementById("message").innerHTML = message;
                invalidMessageDiv.hidden = false;
            }
        </script>
    </body>
</html>
