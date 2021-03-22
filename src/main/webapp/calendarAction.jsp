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
        String aEmails;
        String sql;
        int vEmails = 0;
        aEmails = request.getParameter("CAdmins");
        sql = "SELECT Email from user";
        vEmails = dbConnect.validAdminEmail(sql, aEmails);
        if (vEmails == 1){
            session.setAttribute("ValidEmail", 1);
        } else {
            session.setAttribute("ValidEmail", 1);
        }
        String test = String.valueOf(vEmails);
        response.sendRedirect(test);
    %>
  </body>
</html>