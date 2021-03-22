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
            // 0 = cant open DB
            // 1 = cant parse data
            // 2 = at least one invalid email
            // 3 = all emails are valid!
            int vEmails = 0;
            aEmails = request.getParameter("CAdmins");
            sql = "SELECT Email from user";
            vEmails = dbConnect.validAdminEmail(sql, aEmails);
            vEmails=3;
            if (vEmails == 3) {
                request.setAttribute("ValidEmail", 1);
                request.getRequestDispatcher("CreateCalendar.jsp").forward(request, response);
            } else {
                request.setAttribute("ValidEmail", 0);
                request.getRequestDispatcher("CreateCalendar.jsp").forward(request, response);
            }
            response.sendRedirect("CreateCalendar.jsp");
        %>

    </body>
</html>