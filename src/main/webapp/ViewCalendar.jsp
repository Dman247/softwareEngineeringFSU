<%-- 
    Document   : ViewCalendar
    Created on : Mar 26, 2021, 8:00:54 PM
    Author     : mpolloc4
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
                <h1>Calendar App - View Calendar</h1>
            </div>
            <div class="container">
                <form name="CAction" action="calendarView.jsp">
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" name="CName" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="dropdown show">
                            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Calendar Events:
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Event day:</label>
                            <input type="text" class="form-control" id="MyDay" name="EDay" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Event Time:</label>
                            <input type="text" class="form-control" name="ETime" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Info:</label>
                            <input type="text" class="form-control" name="EInfo" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary btn-block">Load Calendar</button>
                        </div>
                    </div>
                </form>
                <script>
                    var a = document.getElementById("myalert");
                </script>
            </div>
    </body>
</html>
