<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    </head>
    <body>
        <script>
            session.setAttribute("ValidEmail", 1);
            alert(session.getAttribute("ValidEmail"));
        </script>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Calendar App - Create Calendar</h1>
            </div>
            <div class="container">
                <form name="CAction" action="calendarAction.jsp">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" name="CName" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CAdmins">Calendar Admins (emails seperated by commas):</label>
                            <input type="text" class="form-control" name="CAdmins" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CUsers">Calendar Users (emails seperated by commas):</label>
                            <input type="text" class="form-control" name="CUsers" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CInfo">Calendar Info:</label><br>
                            <textarea class="form-control" name="CInfo" rows="3" placeholder="Input information about your calendar."></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary btn-block">Create Calendar</button>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-4">
                            <div class="alert alert-warning" id="myalert" role="alert">
                                This is a success alert—check it out!
                            </div>
                            <script>
                                alert(${ValidEmail});
                                if (ValidEmail == "1") {
                                    document.getElementById("myalert").className = "alert alert-success";
                                    alert(a.class);
                                } else {
                                    document.getElementById("myalert").className = "alert alert-success";
                                    alert(a.class);
                                }
                            </script>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
