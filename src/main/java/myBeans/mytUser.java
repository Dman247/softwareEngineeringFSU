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

public class mytUser {

    protected int UserID = 0;
    protected String Username = "";
    protected String Email = "";
    protected String FirstName = "";
    protected String LastName = "";
    protected String Bio = "";
    protected int PictureID = 0;
    protected String SecurityQ = "";
    protected String SecurityA = "";
    protected String SessionID = "";

    // i couldnt figure an easy way out to expand the array of calendar IDs later if i made these
    // public int[] authedCalendarIDS = new int[0];
    // i tried a few things but i think the scope messes some stuff up, so for now we just return the raw data
    // and can manipulate that on the other end
    protected int tauthedCalendars = 0;
    protected String authedCalendarIDsRAW = "";
    protected int tadminCalendars = 0;
    protected String adminCalendarIDsRAW = "";

    public mytUser(int UserID) {
        String tempDataRAW = "";
        this.UserID = UserID;
        DBconnect udbConnect = new DBconnect();
        tempDataRAW = udbConnect.getUserInfo(UserID);

        // we have valid user data
        if (tempDataRAW != "") {
            String delims = "[$]";
            String[] utokenDataRAW = tempDataRAW.split(delims);
            this.Username = utokenDataRAW[0];
            this.Email = utokenDataRAW[1];
            this.FirstName = utokenDataRAW[2];
            this.LastName = utokenDataRAW[3];
            this.Bio = utokenDataRAW[4];
//            this.PictureID = utokenDataRAW[5];
            this.SecurityQ = utokenDataRAW[6];
            this.SessionID = utokenDataRAW[7];
        }
        
        // we have a valid user id we can grab the calendars
        if (UserID != 0) {
            // i have to do this manipulation to re-size my array for the proper calendar list size
            this.authedCalendarIDsRAW = udbConnect.getAuthedCalendarIDs(UserID);
            // make sure we have at least 1 calendar id
            if (this.authedCalendarIDsRAW != "") {
                String delims = "[,]";
                String[] utokenCalendars = this.authedCalendarIDsRAW.split(delims);
                // stored like: 1,2,3
                this.tauthedCalendars = utokenCalendars.length;
            }
            this.adminCalendarIDsRAW = udbConnect.getAdminCalendarIDs(UserID);
            if (this.adminCalendarIDsRAW != "") {
                String delims = "[,]";
                String[] utokenCalendars = this.adminCalendarIDsRAW.split(delims);
                // stored like: 1,2,3
                this.tadminCalendars = utokenCalendars.length;
            }

        } else {
            this.tauthedCalendars = 0;
            this.tadminCalendars = 0;
        }

    }


    // Gets
    public String getUsername() {
        return this.Username;
    }

    public int getUserID() {
        return this.UserID;
    }

    public String getEmail() {
        return this.Email;
    }

    public String getFirstName() {
        return this.FirstName;
    }

    public String getLastName() {
        return this.LastName;
    }

    public String getBio() {
        return this.Bio;
    }

    public int getPictureID() {
        return this.PictureID;
    }

    public String getSecurityQ() {
        return this.SecurityQ;
    }

    public String getSecurityA() {
        return this.SecurityA;
    }

    public int gettauthedCalendars() {
        return this.tauthedCalendars;
    }

    public String getauthedCalendarIDsRAW() {
        return this.authedCalendarIDsRAW;
    }

    public int gettadminCalendars() {
        return this.tadminCalendars;
    }

    public String getadminCalendarIDsRAW() {
        return this.adminCalendarIDsRAW;
    }

    public String getSessionID() {
        return this.SessionID;
    }
    
    
    // Sets
    public void setUsername(String param) {
        this.Username = param;
    }

    public void setUserID(int param) {
        this.UserID = param;
    }

    public void setEmail(String param) {
        this.Email = param;
    }

    public void setFirstName(String param) {
        this.FirstName = param;
    }

    public void setLastName(String param) {
        this.LastName = param;
    }

    public void setBio(String param) {
        this.Bio = param;
    }

    public void setPictureID(int param) {
        this.PictureID = param;
    }

    public void setSecurityQ(String param) {
        this.SecurityQ = param;
    }

    public void setSecurityA(String param) {
        this.SecurityA = param;
    }

    public void settauthedCalendars(int param) {
        this.tauthedCalendars = param;
    }

    public void setauthedCalendarIDsRAW(String param) {
        this.authedCalendarIDsRAW = param;
    }

    public void settadminCalendars(int param) {
        this.tadminCalendars = param;
    }

    public void setadminCalendarIDsRAW(String param) {
        this.adminCalendarIDsRAW = param;
    }

    public void setSessionID(String param) {
        this.SessionID = param;
    }

    
}