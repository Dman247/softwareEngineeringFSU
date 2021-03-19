/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
/**
 *
 * @author snam
 */
public class DBconnect {
    
  // driver and connection string variables
  private final String driver = "com.mysql.jdbc.Driver";
  private final String url = "jdbc:mysql://localhost:3306/dbcalendar";
  private final String user = "calendar";
  private final String pwd = "calendar";
  
  
  // JDBC variables and methods
  private Connection conn = null;
  private Statement stm = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;
  private ResultSetMetaData rsmd = null;
  
  
  
  
// The two private methods below are used to open and close DB
  private String open() {
    String message = "Opened";
    try {
      Class.forName(driver); // load driver
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }

  private String close() {
    String message = "Closed";
    try {
      stm.close();
      conn.close();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }
  
  
  // Business logic: Method to insert data
  public String insertData(String sql) {
    String message = open();
    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        message = close();
      } catch (Exception e) {
        message = e.getMessage();
      }
    }
    return message;
  }
}
