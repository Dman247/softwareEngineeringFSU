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

public class mytEvent {

    public int EventID = 0;
    public String Date = "";
    public String HourStart = "";
    public String HourFinish = "";
    public String Info = "";
    public String CalendarID = "";
    public String EventName = "";
    public String authedUsersRAW = "";
    public String adminUsersRAW = "";

    public void getInfo(int eID) {
        EventID = eID;
        DBconnect udbConnect = new DBconnect();
        mytEvent tempEvent = new mytEvent();
        tempEvent = udbConnect.getEventInfo(eID);
        Date = tempEvent.Date;
        HourStart = tempEvent.HourStart;
        HourFinish = tempEvent.HourFinish;
        Info = tempEvent.Info;
        CalendarID = tempEvent.CalendarID;
        EventName = tempEvent.EventName;
    }
}
