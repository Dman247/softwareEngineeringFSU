<%-- 
    Document   : ViewCalendar
    Created on : Mar 26, 2021, 8:00:54 PM
    Author     : mpolloc4
--%>

<html>
    <%@include file="header.jsp" %>
    <head>
    </head>
    <body>
        <form name="CAction" action="geteventAction.jsp">
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
        <script>
                        alert(attr(test));
        </script>
        <!--
        <script>
            
            // in this script MyEvents looks like a list of eventnames we now have to parse
            // My event1, myevent2, myevent3 
            var sEvent = "${MyEvents}";
            var sEventIDs = "${MyEventIDs}"
            var i = 0;
            sEvent = sEvent.split(",");
            sEventIDs = sEventIDs.split(",");

            //reset whats in MyDropDown before re-creating it
            $("#MyDropdown").html('');
            for (i = 0; i < sEvent.length; i++) {
                // probably susceptable to SQL injection with GetEventInfo - could grab unauthed event info
                $("#MyDropdownBox").append("<a class=\"dropdown-item\" onclick=\"GetEventInfo(" + sEventIDs[i] + ");\") id=\"MyDropdown\" href=\"#\">" + sEvent[i] + "</a>");
            }
            // when you click an event from the drop down we can do something with it
            function GetEventInfo(myEvent) {
                window.location = "geteventAction.jsp?EventID=" + myEvent;
            }

            var sMyEventDate = "${MyEventDate}";
            if (sMyEventDate.length > 0) {
                $("#EDay").attr('value', sMyEventDate);
            }
            var sMyEventS = "${MyEventS}";
            var sMyEventF = "${MyEventF}";
            if (sMyEventS.length > 0) {
                $("#ETime").attr('value', sMyEventS + " to " + sMyEventF);
            }
        </script>
        -->
    </div>
</body>
</html>
