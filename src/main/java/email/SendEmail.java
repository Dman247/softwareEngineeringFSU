package email;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import myBeans.DBconnect;

public class SendEmail {

  final String senderEmailID = "calendarcscfsu@gmail.com";
  final String senderPassword = "Mahadev123";
  final String emailSMTPserver = "smtp.gmail.com";
  final String emailServerPort = "465";

  public SendEmail(String receiverEmailID, String emailSubject, String emailBody) {
    Properties properties = new Properties();
    properties.put("mail.smtp.user", senderEmailID);
    properties.put("mail.smtp.host", emailSMTPserver);
    properties.put("mail.smtp.port", emailServerPort);
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.socketFactory.port", emailServerPort);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    properties.put("mail.smtp.socketFactory.fallback", "false");
    SecurityManager security = System.getSecurityManager();

    try {
      Authenticator auth = new SMTPAuthenticator();
      Session session = Session.getInstance(properties, auth);
      MimeMessage msg = new MimeMessage(session);
      String tempPass = this.randomPassword();
      DBconnect dbConnect = new DBconnect();
      dbConnect.updatePassword(receiverEmailID, tempPass);
      msg.setText(emailBody + tempPass);
      msg.setSubject(emailSubject);
      msg.setFrom(new InternetAddress(senderEmailID));
      msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmailID));
      Transport.send(msg);
      System.out.println("Message Send");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public String randomPassword() {
    String charSet = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    StringBuilder buffer = new StringBuilder(12);
    for (int i=0; i<12; i++){
      int position = (int)(charSet.length() * Math.random());
      buffer.append(charSet.charAt(position));
    }
    return buffer.toString();
  }

  public class SMTPAuthenticator extends javax.mail.Authenticator {

    @Override
    public PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(senderEmailID, senderPassword);
    }
  }
}
