<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>

	<body>
		<% String Username=request.getParameter("Username"); String Email=request.getParameter("Email"); String
			Password=request.getParameter("Password"); String PasswordC=request.getParameter("PasswordC"); String
			FirstName=request.getParameter("FirstName"); String LastName=request.getParameter("LastName"); String
			Bio=request.getParameter("Bio"); String SecurityQ=request.getParameter("SecurityQ"); String
			SecurityA=request.getParameter("SecurityA"); String
			sql="INSERT INTO user (Username, Email, Password, PasswordC, FirstName, LastName, Bio, PictureID, SecurityQ, SecurityA) VALUES ( '"
			+ Username + "', '" + Email + "', '" + Password + "', '" + PasswordC + "', '" + FirstName + "', '" + LastName
			+ "', '" + Bio + "', 0, '" + SecurityQ + "', '" + SecurityA + "')" ; DBconnect dbConnect=new DBconnect(); String
			err=dbConnect.updateNow(sql); if (err.equals("Closed")) response.sendRedirect("index.jsp"); else %>
			<script>alert("<%= err %>");</script>
	</body>

	</html>