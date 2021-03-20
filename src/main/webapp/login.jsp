<%-- 
    Document   : login
    Created on : Mar 20, 2021, 1:12:57 AM
    Author     : dhague
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Calendar App - Log In</h1>
            </div>
            <div class="container">
                <div class="d-flex justify-content-center">
                    <form action="#">
                        <div class="form-group row">
                            <div class="col-sm">
                                <input type="text" class="form-control" id="userName" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm">
                                <input type="text" class="form-control" id="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm">
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
