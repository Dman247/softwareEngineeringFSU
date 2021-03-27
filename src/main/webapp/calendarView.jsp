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
            String Events;
            String sql;

            Events = dbConnect.getEventsByCalendarID(dbConnect.getCalendarIDByName("hipposaver"));
            
            request.setAttribute("Event", Events);

            request.getRequestDispatcher("ViewCalendar.jsp").forward(request, response);
            response.sendRedirect("ViewCalendar.jsp");
        %>

    </body>
</html>