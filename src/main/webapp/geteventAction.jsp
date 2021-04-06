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
            String Event;
            String MyDate;
            String MyHourS;
            String MyHourF;
            String sql;
            String delims = "[,]+";
            int i;

            //get the date
            Event = request.getParameter("EventID");
            MyDate = dbConnect.getEventDateByID(Integer.parseInt(Event));
            request.setAttribute("MyEventDate", MyDate);

            //get the hours
            MyHourS = dbConnect.getEventHourStartByID(Integer.parseInt(Event));
            MyHourF = dbConnect.getEventHourFinishByID(Integer.parseInt(Event));
            request.setAttribute("MyEventS", MyHourS);
            request.setAttribute("MyEventF", MyHourF);

            
            request.getRequestDispatcher("ViewCalendar.jsp").forward(request, response);
            response.sendRedirect("ViewCalendar.jsp");
        %>

    </body>
</html>