<%-- 
    Document   : logout
    Created on : May 9, 2021, 12:38:33 PM
    Author     : dhague
--%>
<%-- 
    Document   : loginAction
    Created on : Mar 22, 2021, 1:19:16 AM
    Author     : dhague
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
</head>
<body>
    <%@include file="header.jsp" %>

    <script>
        var sessionID = "${sessionID}";
        console.log(sessionID);
    </script>
    <%
      DBconnect dbConnect = new DBconnect();
      String sessionID = request.getParameter("sessionID");
      String result = dbConnect.logout(sessionID);
      request.getRequestDispatcher("index.jsp").forward(request, response);
      
    %>
</body>
</html>