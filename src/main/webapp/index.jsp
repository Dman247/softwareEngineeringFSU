<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
        
    </head>
    <body>
        <%@include file="header.jsp" %>
        <script>
            var sessionID = "${sessionID}";
            if (sessionID) alert(sessionID);
        </script>
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Calendar App</h1>
            </div>
             <nav class="navbar navbar-expand-sm bg-light">
                <a href="index.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Home</button></a>
                <br>
                <a href="register.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Register</button></a>
                <br>
                <a href="login.jsp" class="w3-bar-item w3-button right"><button type="button" class="btn btn-link">Log In</button></a>
                <br>
                <a href="CreateCalendar.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Create Calendar</button></a>
                <br>
                <a href="viewEvent.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">View Event</button></a>
                <br>
                <a href="searchbar.jsp" class="w3-bar-item w3-button"><button type="button" class="btn btn-link">Search Bar</button></a>
                <br>
            </div>
            </nav>
        </div>
        
        
        <div class="container">          
  <img src="calendar.png" class="rounded" alt="Cinque Terre" width="850" height="350"> 
  <p></p>
</div>
  
        <%@include file="footer.jsp" %>
    </body>
</html>
