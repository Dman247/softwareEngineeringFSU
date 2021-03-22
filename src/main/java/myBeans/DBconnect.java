/*
 * Business logic to connect to database.
 * @author nmahadev
 */
package myBeans;

import java.sql.*;

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
    if(message.equals("Success")) {
      try {
        stm.executeUpdate(sql);
        closeDB();
        return "Update Successful";
      }
      catch(Exception e) {
        closeDB();
        return e.getMessage();
      }
    }
    return message;
  }
    // TODO:
    // validate against 2x of the same email in the string
    public int validAdminEmail(String sql, String strEmail){
        int i=0;
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
        if (message.equals("Success")){
            try{
                rst = stm.executeQuery(sql);
                // loop through all emails looking for your email
                while(rst.next()){
                    // reset i so we start back at the beggining of our input email list
                    i = 0;
                    // loop thru all input emails vs the one grabbed from the db
                    for (i=0;i<utokenEmail.length;i++){
                        if (rst.getString("Email").equals(utokenEmail[i])){
                            // we found a valid email so increase the valid count
                            // eventually we can compare the valid amount to the input amount to make
                            // sure that all emails are valid. this way we only need to access the db once
                            totalValid++;
                        }
                    }
                }
                closeDB();
                return isValid;
            } catch (Exception e){
                isValid = 1;
                closeDB();
                return isValid;
            }
        } else {
        isValid = 0;
        return isValid;
        }
    }
  
public String getUsername(String sql){
    String result = "Error: ";
    String message = openDB();
    String Username;
    if (message.equals("Success")){
        try {
            rst = stm.executeQuery(sql);
            rsmd = rst.getMetaData();
            rsmd.getColumnCount();
            rst.next();
            Username = rst.getString("Username");
            return Username;
        } catch (Exception e) {
            return "99";
        }
    } else {
        return "0";
    }
}


}
