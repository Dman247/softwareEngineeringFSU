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
                <form name="CAction" action="calendarView.jsp?GetEventInfo=0&GetCalendarInfo=0">
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary btn-block">Simulate load in from View Calendar link</button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendars:</label>
                            <div class="dropdown show">
                                <a class="col-sm-12 btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Your Calendars:
                                </a>
                                <div class="col-sm-12 dropdown-menu" id="MyCDropdownBox" aria-labelledby="dropdownMenuButton" w>
                                    <a class="col-sm-12 dropdown-item" id="MyCDropdown" href="#">No calendars found</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" id="CName" name="CName" placeholder="My Calendar Name" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Info:</label>
                            <input type="text" class="form-control" id="CInfo" name="CInfo" placeholder="My Calendar Info" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Admins:</label>
                            <input type="text" class="form-control" id="CAdmins" name="CAdmins" placeholder="Admin1, Admin2" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Users:</label>
                            <input type="text" class="form-control" id="CUsers" name="CUsers" placeholder="User1, User2" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Calendar Events:</label>
                            <div class="dropdown show">
                                <a class="col-sm-12 btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Events:
                                </a>
                                <div class="col-sm-12 dropdown-menu" id="MyDropdownBox" aria-labelledby="dropdownMenuButton" w>
                                    <a class="col-sm-12 dropdown-item" id="MyDropdown" href="#">No Current Events</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- hidden input to supply a 0 for GetEventInfo so it doesnt NULL -->
                    <input type="hidden" name="GetEventInfo" id="GetEventInfo" value="0">

                    <!-- hidden input to supply a 0 for GetCalendarInfo so it doesnt NULL -->
                    <input type="hidden" name="GetCalendarInfo" id="GetCalendarInfo" value="0">

                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Event date:</label>
                            <input type="text" class="form-control" id="EDay" name="EDay" placeholder="Date: yyyy-mm-dd" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label from="CName">Event Time:</label>
                            <input type="text" class="form-control" id="ETime" name="ETime" placeholder="Time: hh:mm" readonly>
                        </div>
                    </div>
                </form>
            </div>
            <script>
                //update calendar info
                var sMyCInfo = "${MyCInfo}";
                $("#CInfo").attr('value', sMyCInfo);

                // update calendar name
                var sMyCName = "${MyCName}";
                $("#CName").attr('value', sMyCName);

                // update authed users
                var sMyUsernames = "${MyUsernames}";
                $("#CUsers").attr('value', sMyUsernames);

                // update calendar admins
                var sMyAdmins = "${MyAdmins}";
                $("#CAdmins").attr('value', sMyAdmins);

                // validate session
                // we now have the session set by the login servlet
                // and can compare it to the session in the db later to grab information based on it
                var sMySession = "${MySession}";

                var sCNames = "${MyCNames}";
                var tokensCNames = "";
                var i = 0;
                tokensCNames = sCNames.split(", ");

                //empty the dropdown for population
                $("#MyCDropdownBox").empty();
                for (i = 0; i < tokensCNames.length; i++)
                {
                    // very suseptable to SQL injection
                    $("#MyCDropdownBox").append("<a class=\"dropdown-item\" onclick=\"GCInfo('" + tokensCNames[i] + "');\") id=\"MyDropdown\" href=\"#\">" + tokensCNames[i] + "</a>");
                }

                // when you click a calendar from the drop down we can do something with it
                function GCInfo(myCalendarName) {
                    location.href("calendarView.jsp?&GetEventInfo=0&GetCalendarInfo=1&CName=" + myCalendarName + "&GCalendarName=" + myCalendarName);
                }

                // in this script MyEvents looks like a list of eventnames we now have to parse
                // My event1, myevent2, myevent3 
                var sEvent = "${MyEvent}";
                var sEventIDs = "${MyEventIDs}";
                var tokensEventIDs = "";
                var tokensEvent = "";
                var i = 0;
                tokensEvent = sEvent.split(", ");
                tokensEventIDs = sEventIDs.split(",");

                // need this to pass the calendar name when looking at events to preserve info
                var sCNames = "${MyCName}";

                //reset whats in MyDropDown before re-creating it
                $("#MyDropdownBox").empty();
                for (i = 0; i < tokensEvent.length; i++)
                {
                    // probably susceptable to SQL injection with GetEventInfo - could grab unauthed event info
                    $("#MyDropdownBox").append("<a class=\"dropdown-item\" onclick=\"GetEventInfo(" + tokensEventIDs[i] + ");\") id=\"MyDropdown\" href=\"#\">" + tokensEvent[i] + "</a>");
                }

                // when you click an event from the drop down we can do something with it
                function GetEventInfo(smyEvent) {
                    //geteventinfo=1 so we are now looking for evnt info
                    location.href("calendarView.jsp?GetCalendarInfo=1&GCalendarName=" + sCNames + "&GetEventInfo=1&EventID=" + smyEvent);
                }


                var sMyEventDate = "${MyEventDate}";
                if (sMyEventDate.length > 0)
                {
                    $("#EDay").attr('value', sMyEventDate);
                }

                var sMyEventS = "${MyEventS}";
                var sMyEventF = "${MyEventF}";
                if (sMyEventS.length > 0)
                {
                    $("#ETime").attr('value', sMyEventS + " to " + sMyEventF);
                }

            </script>
    </body>
</html>
