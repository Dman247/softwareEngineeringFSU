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
  
  public int getUserID(String sql){
    String result = "Error: ";
    String message = openDB();
    int uID = 0;
    if (message.equals("Success")){
        try {
            rst = stm.executeQuery(sql);
            rsmd.getColumnCount();
            return rsmd.getColumnCount();
        } catch (Exception e) {
            return 99;
        }
    } else {
        return 0;
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
  
  public String isWorking() {
    String result = openDB();
    if(result.equals("Success")) {
        closeDB();
        return result;
    } else {
        return result;
    }
  }
}
