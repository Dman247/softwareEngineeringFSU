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
                      String sql = "select Date, HourStart, HourFinish, Info,EventName  from event";
                      
                  %>

                      
                      <div class="container">
            <table class="table-dark text dark" border="50">
                 <ol type = “1”>
      <%= dbConnect.searchBar(sql)%>  
      </ol>
    </table>
        
    </body>
</html>
