<%-- 
    Document   : navBarAction
    Created on : May 9, 2021, 10:11:05 PM
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
    <%
      DBconnect dbConnect = new DBconnect();
      String sessionID = request.getParameter("sessionID");
      String site = request.getParameter("site");
      request.setAttribute("sessionID", sessionID);
      request.getRequestDispatcher(site).forward(request, response);
    %>
</body>
</html>
