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
            String uEmails;
            String cInfo;
            String cName;
            String sql;
            int i = 0;
            // used for splitting up emails
            String delims = "[,]+";

            // is valis is used to decide if all data is valid at the end
            // if it is we create the calendar! i tried to stay with the numbering convention
            // 1 = good
            // 2 = bad
            int isValid = 1;

            // 0 = cant open DB
            // 1 = cant parse data
            // 2 = at least one invalid email
            // 3 = all emails are valid!
            int vEmails = 0;

            // intialze variables (this is because in our createcalendar javascript
            // we still technically need a value to check in our If/Else or it errors out
            // 0 = init
            // 1 = good
            // 2 = bad
            request.setAttribute("vAdminEmail", 0);
            request.setAttribute("vInput", 0);
            request.setAttribute("vUserEmail", 0);

            aEmails = request.getParameter("CAdmins");
            uEmails = request.getParameter("CUsers");
            cInfo = request.getParameter("CInfo");
            cName = request.getParameter("CName");
            // first verify that all fields have info
            if (cInfo == "" || cName == "" || uEmails == "" || aEmails == "") {
                request.setAttribute("vInput", 2);
                isValid = 2;
            } else {
                // input has something
                request.setAttribute("vInput", 1);
                sql = "SELECT Email from user";
                // check admin emails to maske sure theyre valid
                vEmails = dbConnect.validEmail(sql, aEmails);
                if (vEmails == 3) {
                    request.setAttribute("vAdminEmail", 1);
                } else {
                    isValid = 2;
                    request.setAttribute("vAdminEmail", 2);
                }
                // check user emails to make sure theyre valid
                vEmails = dbConnect.validEmail(sql, uEmails);
                if (vEmails == 3) {
                    request.setAttribute("vUserEmail", 1);
                } else {
                    isValid = 2;
                    request.setAttribute("vUserEmail", 2);
                }
            }

            // if isValid is still one after all checks we have valid data to
            // input into our db
            if (isValid == 1) {

                // create calendar              
                sql = "INSERT INTO calendar (Name, PictureID, Info) VALUES ('" + cName + "',0,'" + cInfo + "')";
                dbConnect.updateNow(sql);

                // add calendar admins to the new calendar
                aEmails = aEmails.replaceAll(" ", "");
                String[] utokenEmail = aEmails.split(delims);
                // possible issue here if we allow duplicate emails
                // possible issue here if we allow duplicate calendar names
                for (i = 0; i < utokenEmail.length; i++) {
                    sql = "INSERT INTO admincalendar (UserID, CalendarID) VALUES (" + dbConnect.getUserIDByEmail(utokenEmail[i]) + "," + dbConnect.getCalendarIDByName(cName) + ")";
                    dbConnect.updateNow(sql);
                }

                // add calendar users to the new calendar
                aEmails = aEmails.replaceAll(" ", "");
                utokenEmail = uEmails.split(delims);
                // possible issue here if we allow duplicate emails
                // possible issue here if we allow duplicate calendar names
                for (i = 0; i < utokenEmail.length; i++) {
                    sql = "INSERT INTO authedcalendar (UserID, CalendarID) VALUES (" + dbConnect.getUserIDByEmail(utokenEmail[i]) + "," + dbConnect.getCalendarIDByName(cName) + ")";
                    dbConnect.updateNow(sql);
                }
            }
            request.getRequestDispatcher("CreateCalendar.jsp").forward(request, response);
            response.sendRedirect("CreateCalendar.jsp");
        %>

    </body>
</html>
