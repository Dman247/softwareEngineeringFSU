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
                <form name="CAction" action="calendarAction.jsp">
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" name="CName" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CAdmins">Calendar Admins (emails seperated by commas):</label>
                            <input type="text" class="form-control" name="CAdmins" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CUsers">Calendar Users (emails seperated by commas):</label>
                            <input type="text" class="form-control" name="CUsers" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CInfo">Calendar Info:</label><br>
                            <textarea class="form-control" name="CInfo" rows="3" placeholder="Input information about your calendar."></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary btn-block">Create Calendar</button>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6">
                            <div class="alert alert-warning" id="myalert" role="alert" style="display: none;">>
                                This is an alert, this text will be changed and displayed once you click submit
                            </div>
                            <script>
                                //script to change the alert bootstrap box depending on errors
                                var a = document.getElementById("myalert");

                                //Err is used to stop the If statements if any errors occur in previous checks-->
                                var Err = 0;

                                //check if all fields have input
                                if (${vInput} == 2) {
                                    a.className = "alert alert-danger";
                                    a.style.display = "block";
                                    a.innerHTML = "Status: Error - Please fill out all fields";
                                    Err = 1;
                                }

                                // check to make sure all admin emails are valid
                                if (${vAdminEmail} == 1 && Err == 0) {
                                    a.className = "alert alert-success";
                                    a.style.display = "block";
                                    a.innerHTML = "Status: Calendar has been created!";
                                } else if (${vAdminEmail} == 2 && Err == 0) {
                                    a.className = "alert alert-danger";
                                    a.style.display = "block";
                                    a.innerHTML = "Status: Error - Please make sure all admin emails are valid";
                                    Err = 2;
                                }
                                
                                // check to make sure all authed user emails are valid
                                if (${vUserEmail} == 1 && Err == 0) {
                                    a.className = "alert alert-success";
                                    a.style.display = "block";
                                    a.innerHTML = "Status: Calendar has been created!";
                                } else if (${vUserEmail} == 2 && Err == 0) {
                                    a.className = "alert alert-danger";
                                    a.style.display = "block";
                                    a.innerHTML = "Status: Error - Please make sure all user emails are valid";
                                    Err = 3;
                                }
                            </script>
                        </div>
                    </div>
                </form>
            </div>
        </div>
                                    <%@include file="footer.jsp" %>
    </body>
</html>
