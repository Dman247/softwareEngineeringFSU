<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file="header.jsp" %>
        
          
                  <%
                      DBconnect dbConnect = new DBconnect();
                      String Event;
                      String MyDate;
                      String MyHourS;
                      String MyHourF;
                      String sql;
                      
                  %>

      <%= dbConnect.searchBar(sql)%>  

        
    </body>
</html>
