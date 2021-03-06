/*
 * Business logic to connect to database.
 * @author nmahadev
 */
package myBeans;

import java.sql.*;
import myBeans.mytUser;

public class DBconnect {

    // Declare variables
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/dbCalendar";
    String user = "root";
    String pwd = "";

    // Databaseobject to declare
    Connection conn;
    Statement stm;
    ResultSet rst;
    ResultSetMetaData rsmd;

    Statement stm1;
    ResultSet rst1;
    ResultSetMetaData rsmd1;

    // Connect to database
    private String openDB() {
        try {
            Class.forName(driver); // Load the MySQL driver
            conn = DriverManager.getConnection(url, user, pwd);
            stm = conn.createStatement();
            return "Success";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    private void closeDB() {
        try {
            stm.close();
            conn.close();
        } catch (Exception e) {
        }
    }

    // Add stuff into database
    public String updateNow(String sql) {
        String message = openDB();
        if (message.equals("Success")) {
            try {
                stm.executeUpdate(sql);
                closeDB();
                return "Update Successful";
            } catch (Exception e) {
                closeDB();
                return e.getMessage();
            }
        }
        return message;
    }

    // TODO:
    // validate against 2x of the same email in the string
    public int validEmail(String sql, String strEmail) {
        int i = 0;
        // 0 = cant open DB
        // 1 = cant parse data
        // 2 = at least one invalid email
        // 3 = all emails are valid!
        int isValid = 2;
        int totalValid = 0;
        // parse at , and multiple ,'s treated as one
        String delims = "[,]+";
        // replace spaces so formatting like name@name.com, name@name.com works as well as name@name.com,name@name.com
        strEmail = strEmail.replaceAll(" ", "");
        String[] utokenEmail = strEmail.split(delims);
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                // loop through all emails looking for your email
                while (rst.next()) {
                    // reset i so we start back at the beggining of our input email list
                    i = 0;
                    // loop thru all input emails vs the one grabbed from the db
                    for (i = 0; i < utokenEmail.length; i++) {
                        if (rst.getString("Email").equals(utokenEmail[i])) {
                            // we found a valid email so increase the valid count
                            // eventually we can compare the valid amount to the input amount to make
                            // sure that all emails are valid. this way we only need to access the db once
                            totalValid++;
                        }
                    }
                }
                closeDB();
                // if all of the emails are valid
                if (totalValid == utokenEmail.length) {
                    return 3;
                } else {
                    // if there are any bad emails
                    return 2;
                }
            } catch (Exception e) {
                isValid = 1;
                closeDB();
                return isValid;
            }
        } else {
            isValid = 0;
            return isValid;
        }
    }

    public int getUserIDBySession(String SessionID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        int uID = 0;
        if (message.equals("Success")) {
            sql = "SELECT * FROM user WHERE SessionID='" + SessionID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                uID = rst.getInt("UserID");
                closeDB();
                return uID;
            } catch (Exception e) {
                closeDB();
                return 0;
            }
        } else {
            closeDB();
            return 0;
        }
    }

    public int getUserIDByEmail(String email) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        int uID = 0;
        if (message.equals("Success")) {
            sql = "SELECT * FROM user WHERE Email='" + email + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                uID = rst.getInt("UserID");
                closeDB();
                return uID;
            } catch (Exception e) {
                closeDB();
                return 0;
            }
        } else {
            closeDB();
            return 0;
        }
    }

    public int getCalendarIDByName(String CalendarName) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        int cID;
        if (message.equals("Success")) {
            sql = "SELECT * FROM calendar WHERE Name='" + CalendarName + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                cID = rst.getInt("CalendarID");
                closeDB();
                return cID;
            } catch (Exception e) {
                closeDB();
                return 0;
            }
        } else {
            closeDB();
            return 0;
        }
    }

    public String getCalendarNameByID(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String cName;
        if (message.equals("Success")) {
            sql = "SELECT * FROM calendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                cName = rst.getString("Name");
                closeDB();
                return cName;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getCalendarInfoByID(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String cInfo;
        if (message.equals("Success")) {
            sql = "SELECT * FROM calendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                cInfo = rst.getString("Info");
                closeDB();
                return cInfo;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getEventNameByID(int EventID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String EventName = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE EventID='" + EventID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    EventName = rst.getString("EventName");
                }
                closeDB();
                return EventName;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getEventDateByID(int EventID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String EventDate = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE EventID='" + EventID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    EventDate = rst.getString("Date");
                }
                closeDB();
                return EventDate;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getEventHourStartByID(int EventID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String EventDate = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE EventID='" + EventID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    EventDate = rst.getString("HourStart");
                }
                closeDB();
                return EventDate;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getEventHourFinishByID(int EventID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String EventDate = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE EventID='" + EventID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    EventDate = rst.getString("HourFinish");
                }
                closeDB();
                return EventDate;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    // saves events to a string in the format
    // event1, event2, event3
    // for parsing 
    public String getEventsByCalendarID(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String EventID = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    EventID = EventID + String.valueOf(rst.getInt("EventID")) + ",";
                }
                // removes the last ,
                EventID = EventID.substring(0, EventID.length() - 1);
                closeDB();
                return EventID;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    // saves events to a string in the format
    // event1, event2, event3
    // for parsing 
    public String getCalendarUsersByCalendarID(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String users = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM authedcalendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    users = users + rst.getInt("UserID") + ",";
                }
                // removes the last ,
                users = users.substring(0, users.length() - 1);
                closeDB();
                return users;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    // saves events to a string in the format
    // event1, event2, event3
    // for parsing 
    public String getCalendarAdminsByCalendarID(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String users = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM admincalendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    users = users + rst.getInt("UserID") + ",";
                }
                // removes the last ,
                users = users.substring(0, users.length() - 1);
                closeDB();
                return users;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getUserNameByID(int UserID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String Username = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM user WHERE UserID='" + UserID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    Username = rst.getString("Username");
                }
                closeDB();
                return Username;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    //new getuserinfo for proper objects
    public String getUserInfo(int UserID) {
        String sql;
        String message = openDB();
        String tempDataRAW = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM user WHERE UserID='" + UserID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                tempDataRAW = rst.getString("Username");
                tempDataRAW = tempDataRAW + "$" + rst.getString("Email");
                tempDataRAW = tempDataRAW + "$" + rst.getString("First Name");
                tempDataRAW = tempDataRAW + "$" + rst.getString("Last Name");
                tempDataRAW = tempDataRAW + "$" + rst.getString("Bio");
                tempDataRAW = tempDataRAW + "$" + rst.getString("PictureID");
                tempDataRAW = tempDataRAW + "$" + rst.getString("SecurityQ");
                tempDataRAW = tempDataRAW + "$" + rst.getString("SessionID");
                closeDB();
                return tempDataRAW;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getEventInfo(int EventID) {
        String sql;
        String tempDataRAW = "";
        String message = openDB();
        if (message.equals("Success")) {
            sql = "SELECT * FROM event WHERE EventID='" + EventID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                tempDataRAW = rst.getString("Date");
                tempDataRAW = tempDataRAW + "$" + rst.getString("HourStart");
                tempDataRAW = tempDataRAW + "$" + rst.getString("HourFinish");
                tempDataRAW = tempDataRAW + "$" + rst.getString("Info");
                tempDataRAW = tempDataRAW + "$" + rst.getString("CalendarID");
                tempDataRAW = tempDataRAW + "$" + rst.getString("EventName");
                closeDB();
                return tempDataRAW;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getCalendarInfo1(int CalendarID) {
        String sql;
        String tempDataRAW = "";
        String message = openDB();
        if (message.equals("Success")) {
            sql = "SELECT * FROM calendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                //had to use $ as a delim cuz we use , to seperate authed
                tempDataRAW = rst.getString("Name");
                tempDataRAW = tempDataRAW + "$" + rst.getString("PictureID");
                tempDataRAW = tempDataRAW + "$" + rst.getString("Info");
                closeDB();
                tempDataRAW = tempDataRAW + "$" + getCalendarUsersByCalendarID(CalendarID);
                tempDataRAW = tempDataRAW + "$" + getCalendarAdminsByCalendarID(CalendarID);
                tempDataRAW = tempDataRAW + "$" + getEventsByCalendarID(CalendarID);
                return tempDataRAW;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public mytCalendar getCalendarInfo(int CalendarID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        mytCalendar tempCalendar = new mytCalendar();
        if (message.equals("Success")) {
            sql = "SELECT * FROM calendar WHERE CalendarID='" + CalendarID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                tempCalendar.CalendarID = CalendarID;
                tempCalendar.Name = rst.getString("Name");
                tempCalendar.PictureID = rst.getString("PictureID");
                tempCalendar.Info = rst.getString("Info");
                closeDB();
                tempCalendar.authedUsersRAW = getCalendarUsersByCalendarID(CalendarID);
                tempCalendar.adminUsersRAW = getCalendarAdminsByCalendarID(CalendarID);
                tempCalendar.eventIDsRAW = getEventsByCalendarID(CalendarID);
                return tempCalendar;
            } catch (Exception e) {
                closeDB();
                return tempCalendar;
            }
        } else {
            closeDB();
            return tempCalendar;
        }
    }

    public String getAuthedCalendarIDs(int UserID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String cNames = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM authedcalendar WHERE UserID='" + UserID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    cNames = cNames + rst.getInt("CalendarID") + ",";
                }
                closeDB();
                // make sure that we have a , at the end of the string (means we found at least 1 calendar id)
                // apparently comparing substring returned 0 if they are equal so i have to do not equal... weird
                if (cNames.substring(cNames.length() - 1) != ",") {
                    cNames = cNames.substring(0, cNames.length() - 1);
                }
                return cNames;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getAdminCalendarIDs(int UserID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        String cNames = "";
        if (message.equals("Success")) {
            sql = "SELECT * FROM admincalendar WHERE UserID='" + UserID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    cNames = cNames + rst.getInt("CalendarID") + ",";
                }
                closeDB();
                // make sure that we have a , at the end of the string (means we found at least 1 calendar id)
                // apparently comparing substring returned 0 if they are equal so i have to do not equal... weird
                if (cNames.substring(cNames.length() - 1) != ",") {
                    cNames = cNames.substring(0, cNames.length() - 1);
                }
                return cNames;
            } catch (Exception e) {
                closeDB();
                return "";
            }
        } else {
            closeDB();
            return "";
        }
    }

    public String getUsername(String sql) {
        String result = "Error: ";
        String message = openDB();
        String Username;
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                Username = rst.getString("Username");
                closeDB();
                return Username;
            } catch (Exception e) {
                closeDB();
                return "99";
            }
        } else {
            closeDB();
            return "0";
        }
    }

    public String randomString() {
        String charSet = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder buffer = new StringBuilder(12);
        for (int i = 0; i < 16; i++) {
            int position = (int) (charSet.length() * Math.random());
            buffer.append(charSet.charAt(position));
        }
        return buffer.toString();
    }

    public String createSessionID(String userName) {
        String randomString = this.randomString();
        String sql = "UPDATE user SET SessionID = '" + randomString + "' WHERE user.Username = '" + userName + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                stm.executeUpdate(sql);
                closeDB();
                return randomString;
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return "";
            }
        } else {
            System.out.println(message);
            return "";
        }
    }

    public String login(String userName, String password) {
        String returnValue = "";
        int sqlResult = 0;
        String sql = "SELECT count(*) as 'Count' FROM user WHERE Username = '"
                + userName
                + "' AND Password = '"
                + password
                + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                while (rst.next()) {
                    sqlResult = rst.getInt("Count");
                }
                closeDB();
                if (sqlResult == 1) {
                    returnValue = this.createSessionID(userName);
                }
                return returnValue;
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return "";
            }
        } else {
            System.out.println(message);
            return "";
        }
    }

    public String dropdown(String sql) {
        String result = "<option disabled selected>Select one ...</option>\n";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                while (rst.next()) {
                    result += "<option value='" + rst.getInt(1) + "'>";
                    for (int i = 2; i <= count; i++) {
                        result += rst.getString(i) + " ";
                    }
                    result += "</option>\n";
                }
                closeDB();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }

    // Business logic: Method to display query as html table. 
    // Function call goes between <table> and </table> tags
    public String createHTMLTable(String sql) {
        String html = "";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                html += "<thead><tr>";
                for (int i = 1; i <= count; i++) {
                    html += "<td>" + rsmd.getColumnName(i) + "</td>";
                }
                html += "</tr></thead>";

                html += "<tbody>";
                while (rst.next()) {
                    html += "<tr>";
                    for (int i = 1; i <= count; i++) {
                        html += "<td>" + rst.getString(i) + "</td>";
                    }
                    html += "</tr>";
                }
                html += "</tbody>";
                closeDB();
                return html;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }

    }

    public String createHTMLDropdown(String sql) {
        String html = "";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                while (rst.next()) {
                    html += "<option value='" + rst.getString(1) + "'>";
                    for (int i = 2; i <= count; i++) {
                        html += rst.getString(i) + " ";
                    }
                    html += "</option>";
                }
                return html;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }

    public boolean checkEmailExists(String email) {
        Boolean returnValue = false;
        String sql = "SELECT Username, Email FROM user WHERE Email='" + email + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                if (rst.first()) {
                    returnValue = true;
                } else {
                    returnValue = false;
                }
                closeDB();
                return returnValue;
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return false;
            }
        } else {
            System.out.println(message);
            return false;
        }
    }

    public boolean checkAnswer(String email, String answer) {
        Boolean returnValue = false;
        String sql = "SELECT Email FROM user WHERE Email='" + email + "' AND SecurityA='" + answer + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                if (rst.first()) {
                    returnValue = true;
                } else {
                    returnValue = false;
                }
                closeDB();
                return returnValue;
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return false;
            }
        } else {
            System.out.println(message);
            return false;
        }
    }

    public String getQuestion(String email) {
        String returnValue = "";
        String sql = "SELECT SecurityQ FROM user WHERE Email='" + email + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                rst = stm.executeQuery(sql);
                if (rst.first()) {
                    returnValue = rst.getString("SecurityQ");
                } else {
                    returnValue = "";
                }
                closeDB();
                return returnValue;
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return "";
            }
        } else {
            System.out.println(message);
            return "";
        }
    }

    public void updatePassword(String email, String password) {
        String sql = "UPDATE user SET Password = '" + password + "' WHERE user.Email = '" + email + "'";
        String message = openDB();
        if (message.equals("Success")) {
            try {
                stm.executeUpdate(sql);
                closeDB();
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
            }
        } else {
            System.out.println(message);
        }
    }

    public void searchBar(String eventName) {
        String result = "";
        String sql = "select * from event where EventName='" + eventName + "'";
        String message = openDB();
        if (message.equals("Success")) {

            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                while (rst.next()) {
                    String Date = rst.getString("date");
                    String HourStart = rst.getString("hourStart");
                    String HourFinish = rst.getString("hourFinish");
                    String Info = rst.getString("info");
                }
                closeDB();
            } catch (Exception e) {
                System.out.println(e);
                closeDB();
                return;
            }

        } else {
            closeDB();
            return ;
         
         
         }
	}
     
    public String logout(String sessionID) {
    String randomString = this.randomString();
    String sql = "UPDATE user SET SessionID = '' WHERE user.SessionID = '" + sessionID + "'";
    String message = openDB();
    if (message.equals("Success")) {
      try {
        stm.executeUpdate(sql);
        closeDB();
        return "Logged Out";
      } catch (Exception e) {
        System.out.println(e);
        closeDB();
        return "";
      }
    } else {
      System.out.println(message);
      return "";
    }
  }

    
    public mytUser getUserBySession(String SessionID) {
        String sql;
        String result = "Error: ";
        String message = openDB();
        int uID = 0;
        if (message.equals("Success")) {
            sql = "SELECT * FROM user WHERE SessionID='" + SessionID + "'";
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                rsmd.getColumnCount();
                rst.next();
                uID = rst.getInt("UserID");
                String bio = rst.getString("Bio");
                String firstName = rst.getString("First Name");
                String lastName = rst.getString("Last Name");
                int pictureID = rst.getInt("PictureID");
                String securityQ = rst.getString("SecurityQ");
                String securityA = rst.getString("SecurityA");
                mytUser user = new mytUser(uID);
                user.setBio(bio);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPictureID(pictureID);
                user.setSecurityQ(securityQ);
                user.setSecurityA(securityA);
                user.setSessionID(SessionID);
                user.setUserID(uID);
                user.setUsername(url);
                closeDB();
                return user;
            } catch (Exception e) {
                closeDB();
                return null;
            }
        } else {
            closeDB();
            return null;
        }
    
  }
}
