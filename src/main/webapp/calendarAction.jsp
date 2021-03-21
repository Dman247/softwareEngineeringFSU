<%-- 
    Document   : calendarAction
    Created on : Mar 20, 2021, 8:35:23 PM
    Author     : mpolloc4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%
        DBconnect dbConnect = new DBconnect();
        String Username;
        int uID = 44;
        String sql;
        sql = "SELECT Username from user where UserID = 2";
        Username = dbConnect.getUsername(sql);
        response.sendRedirect(Username);
    %>

    <script> alert(%<uID%>)</script>
  </body>
</html>