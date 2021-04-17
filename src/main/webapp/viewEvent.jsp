<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="jumbotron text-center">
            <h1>View Event</h1>
            </div>
        <%
            
            String sql = "select Date, HourStart, HourFinish, Info,EventName  from event";
            DBconnect dbConnect = new DBconnect();
 
            
        %>
        <div class="container">
            <table class="table-dark text dark" border="50">
                 <ol type = “1”>
      <%= dbConnect.createHTMLTable(sql)%>  
      </ol>
    </table>
        </div>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
    <%@include file="footer.jsp" %>
    </body>
</html>
