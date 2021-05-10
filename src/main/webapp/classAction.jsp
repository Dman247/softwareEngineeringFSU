<%-- 
    Document   : classAction
    Created on : May 10, 2021, 12:42:31 AM
    Author     : snam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
        <td>2021-05-11</td>
        <td>12:15:00</td>
        <td>13:30:00</td>
        <th>math class in building 1, 2nd floor.</th>
        <th>math class</th>
      </tr>
      <tr>
          <td>2021-05-11</td>
        <td>09:30:00</td>
        <td>10:45:00</td>
        <th>history class</th>
        <th>history class</th>
      </tr>
      <tr>
        <td>2021-05-12</td>
        <td>15:30:00</td>
        <td>16:45:00</td>
        <th>english 12 class</th>
        <th>english class</th>
      </tr>
    </tbody>
  </table>
</div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
