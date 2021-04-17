/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author mpolloc4
 */
package myBeans;

public class mytCalendar {

    public int CalendarID = 0;
    public String Name = "";
    public String PictureID = "";
    public String Info = "";
    public String authedUsersRAW = "";
    public String adminUsersRAW = "";
    public String eventIDsRAW = "";


    public void getInfo(int cID) {
        CalendarID = cID;
        DBconnect udbConnect = new DBconnect();
        mytCalendar tempCalendar = new mytCalendar();
        tempCalendar = udbConnect.getCalendarInfo(cID);
    }
}
