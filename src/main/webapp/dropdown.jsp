<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            
            String sql = "select Date, HourStart, HourFinish, Info from event";
            DBconnect dbConnect = new DBconnect();
 
            
        %>
            <table border="10">
      <%= dbConnect.createHTMLTable(sql)%>              
    </table>
        
    </body>
</html>
