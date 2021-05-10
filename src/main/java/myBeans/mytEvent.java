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

    protected int EventID = 0;
    protected String Date = "";
    protected String HourStart = "";
    protected String HourFinish = "";
    protected String Info = "";
    protected String CalendarID = "";
    protected String EventName = "";
    protected String authedUsersRAW = "";
    protected String adminUsersRAW = "";

    public mytEvent(int EventID) {
        String tempDataRAW = "";
        this.EventID = EventID;
        DBconnect udbConnect = new DBconnect();
        tempDataRAW = udbConnect.getEventInfo(EventID);

        // we have valid user data
        if (tempDataRAW != "") {
            String delims = "[$]";
            String[] utokenDataRAW = tempDataRAW.split(delims);
            this.Date = utokenDataRAW[0];
            this.HourStart = utokenDataRAW[1];
            this.HourFinish = utokenDataRAW[2];
            this.Info = utokenDataRAW[3];
            this.CalendarID = utokenDataRAW[4];
            this.EventName = utokenDataRAW[5];
        }
    }

    // Gets
    public int getEventID() {
        return EventID;
    }

    public String getDate() {
        return Date;
    }

    public String getHourStart() {
        return HourStart;
    }

    public String getHourFinish() {
        return HourFinish;
    }

    public String getInfo() {
        return Info;
    }

    public String getCalendarID() {
        return CalendarID;
    }

    public String getEventName() {
        return EventName;
    }

    public String getauthedUsersRAW() {
        return authedUsersRAW;
    }

    public String getadminUsersRAW() {
        return adminUsersRAW;
    }
}
