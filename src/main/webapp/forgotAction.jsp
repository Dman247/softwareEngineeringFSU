
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="email.SendEmail"%>
<%@page import="myBeans.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Hello World!</h1>
        <%
          DBconnect dbConnect = new DBconnect();
          String answer = request.getParameter("answer");
          if (!(answer != null)) {
            Boolean emailIsValid = dbConnect.checkEmailExists(request.getParameter("email"));
            if (emailIsValid) {
              String question = dbConnect.getQuestion(request.getParameter("email"));
              request.setAttribute("question", question);
              request.setAttribute("email", request.getParameter("email"));
              request.getRequestDispatcher("forgotPassword2.jsp").forward(request, response);
            } else {
              request.setAttribute("message", "Email Entered Does Not Exitst!");
              request.getRequestDispatcher("forgotPassword1.jsp").forward(request, response);
            }
          } else {
            String email = request.getParameter("email");
            Boolean answerIsCorrect = dbConnect.checkAnswer(email, answer);
            if (answerIsCorrect) {
              SendEmail sendMail = new SendEmail(request.getParameter("email"), "Forgot Password - Calendar App", "Here is your new temporary password: ");
              String tempPass = sendMail.randomPassword();
              request.setAttribute("message", "Temporary password sent!");
              request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
              String question = dbConnect.getQuestion(request.getParameter("email"));
              request.setAttribute("question", question);
              request.setAttribute("email", request.getParameter("email"));
              request.setAttribute("message", "Your Security Question was incorrect!");
              request.getRequestDispatcher("forgotPassword2.jsp").forward(request,response);
            }
          }

        %>
    </body>
</html>
