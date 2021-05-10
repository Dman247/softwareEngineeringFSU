<%-- 
    Document   : graduation
    Created on : May 10, 2021, 12:20:40 AM
    Author     : snam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>Date</th>
        <th>HourStart</th>
        <th>HourFinish</th>
        <th>Info</th>
        <th>EventName</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>2021-05-15</td>
        <td>13:00:00</td>
        <td>16:00:00</td>
        <th>fitchburg middle school graduation!</th>
        <th>middle school graduation</th>
      </tr>
      <tr>
        <td>2021-05-15</td>
        <td>10:00:00</td>
        <td>12:00:00</td>
        <th>fitchburg high school graduation!</th>
        <th>high school graduation</th>
      </tr>
    </tbody>
  </table>
</div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
