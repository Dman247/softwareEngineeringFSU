<%-- 
    Document   : forgotPassowrd
    Created on : Mar 22, 2021, 4:58:51 AM
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
                <h1>Calendar App - Forgot Password</h1>
            </div>
            <div class="d-flex justify-content-center">
                <form action="forgotAction.jsp">
                    <div class="form-group row">
                        <div class="">
                            <input type="email" required class="form-control" name="email" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="">
                            <button type="submit" class="btn btn-warning btn-block">Get Security Question</button>
                        </div>
                    </div>
                    <div id="invalid">
                        <div class="alert alert-warning" id="message" role="alert">
                        </div>
                    </div>
                </form>
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
