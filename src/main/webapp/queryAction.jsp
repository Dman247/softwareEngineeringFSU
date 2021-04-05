<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Result</title>
    </head>
    <body>
        <%
      String sql = request.getParameter("query");
      DBconnect dbConnect = new DBconnect();
    %>
    <h2><%= sql%></h2>
    <div class="w3-container w3-table-all w3-border">
      <%=  dbConnect.htmlTable(sql)%>
    </div>
    </body>
</html>
