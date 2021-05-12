<%-- 
    Document   : profileAction
    Created on : May 12, 2021, 12:17:09 AM
    Author     : dhague
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="myBeans.DBconnect, myBeans.mytUser"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
</head>
<body>
    <%
      DBconnect dbConnect = new DBconnect();
      String sessionID = request.getParameter("sessionID");
      mytUser user = dbConnect.getUserBySession(sessionID);
      
      String firstName = user.getFirstName();
      String lastName = user.getLastName();
      String email = user.getEmail();
      String bio = user.getBio();
      
      request.setAttribute("firstName", firstName);
      request.setAttribute("lastName", lastName);
      request.setAttribute("bio", bio);
      request.setAttribute("email", email);
      request.setAttribute("sessionID", sessionID);
      
      request.getRequestDispatcher("profile.jsp").forward(request, response);
      
      
    %>
</body>
</html>
