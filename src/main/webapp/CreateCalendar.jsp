<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Calendar App - Create Calendar</h1>
            </div>
            <div class="container">
                <form name="CAction" action="calendarAction.jsp" method="get">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" id="CName" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                           <label from="CAdmins">Calendar Admins (seperated by commas):</label>
                            <input type="text" class="form-control" id="CAdmins" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                           <label from="CUsers">Calendar Users (seperated by commas):</label>
                            <input type="text" class="form-control" id="CUsers" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                           <label from="CInfo">Calendar Info:</label><br>
                           <textarea class="form-control" id="CInfo" rows="3" placeholder="Input information about your calendar."></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary btn-block">Create Calendar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
