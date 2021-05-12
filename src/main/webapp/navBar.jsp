<%-- 
    Document   : navBar
    Created on : May 9, 2021, 12:00:20 PM
    Author     : dhague
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <script>
            var sessionID = "${sessionID}";
        </script>
        <nav class="navbar navbar-expand-sm bg-light">
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=index.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Home</button></a>
            <br>
            <a href="register.jsp" id="thisone" class="w3-bar-item w3-button unAuthedLink"><button type="button" class="btn btn-link">Register</button></a>
            <br>
            <a href="login.jsp" class="w3-bar-item w3-button right unAuthedLink"><button type="button" class="btn btn-link">Log In</button></a>
            <br>
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=profileAction.jsp" class="w3-bar-item w3-button AuthedLink"><button type="button" class="btn btn-link">Profile</button></a>
            <br>
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=CreateCalendar.jsp" class="w3-bar-item w3-button AuthedLink"><button type="button" class="btn btn-link">Create Calendar</button></a>
            <br>
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=calendarView.jsp?&GetEventInfo=0&GetCalendarInfo=1&CName=&GCalendarName=" class="w3-bar-item w3-button AuthedLink"><button type="button" class="btn btn-link">View Calendar</button></a>
            <br>
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=searchbar.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Search Bar</button></a>
            <br>
            <a href="navBarAction.jsp?sessionID=${sessionID}&site=logoutAction.jsp" class="w3-bar-item w3-button right AuthedLink"><button type="button" class="btn btn-link">Log Out</button></a>
            <br>
        </nav>
        <script>
            authedLinks = document.getElementsByClassName("AuthedLink");
            unAuthedLinks = document.getElementsByClassName("unAuthedLink");
            console.log("Here is the session ID");
            console.log(sessionID);
            if (sessionID === "") {
                authedLinks[0].hidden = true;
                authedLinks[1].hidden = true;
                authedLinks[2].hidden = true;
                authedLinks[3].hidden = true;
            } else {
                unAuthedLinks[0].hidden = true;
                unAuthedLinks[1].hidden = true;
            }

            function forwardSession() {

            }
        </script>
    </body>
</html>
