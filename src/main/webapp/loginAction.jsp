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
    <%
      DBconnect dbConnect = new DBconnect();
      String userName = request.getParameter("userName");
      String password = request.getParameter("password");
      int result = dbConnect.login(userName, password);
      if (result > 0) {
        request.setAttribute("authed", true);
        request.getRequestDispatcher("index.jsp").forward(request, response);
      } else {
        request.setAttribute("message", "Incorrect Username or Password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
      }
//      response.sendRedirect("CreateCalendar.jsp");
//      response.sendRedirect("index.jsp");
    %>
</body>
</html>
