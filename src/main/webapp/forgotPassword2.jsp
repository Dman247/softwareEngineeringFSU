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
                            <h3 id="question"></h3>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="">
                            <input type="text" name="answer" class="form-control" required placeholder="Enter Security Answer">
                        </div>
                    </div>
                    <div class="from-group row" hidden>
                        <div class="">
                            <input type="email" required class="form-control" name="email" placeholder="Email" value="${email}">
                        </div>
                    </div> 
                    <div class="form-group row">
                        <div class="">
                            <button type="submit" class="btn btn-danger btn-block">Recover</button>
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
            question = "${question}";
            console.log(question);
            document.getElementById("question").innerHTML = question;

            invalidMessageDiv = document.getElementById("invalid");
            message = "${message}";
            if (message === "") {
                invalidMessageDiv.hidden = true;
            } else {
                document.getElementById("message").innerHTML = message;
                invalidMessageDiv.hidden = false;
            }
        </script>
    </body>
</html>
