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

    public int UserID = 0;
    public String Username = "";
    public String Email = "";
    public String FirstName = "";
    public String LastName = "";
    public String Bio = "";
    public String PictureID = "";
    public String SecurityQ = "";
    public String SessionID = "";

    // i couldnt figure an easy way out to expand the array of calendar IDs later if i made these
    // public int[] authedCalendarIDS = new int[0];
    // i tried a few things but i think the scope messes some stuff up, so for now we just return the raw data
    // and can manipulate that on the other end
    public int tauthedCalendars = 0;
    public String authedCalendarIDsRAW = "";
    public int tadminCalendars = 0;
    public String adminCalendarIDsRAW = "";

    // create a db object to access mysql
    // and a userobject to easily handle the returns from dbserver
    public void getInfo(int uID) {
        DBconnect udbConnect = new DBconnect();
        mytUser myaUser = new mytUser();

        UserID = uID;
        myaUser = udbConnect.getUserInfo(uID);
        Username = myaUser.Username;
        FirstName = myaUser.FirstName;
        LastName = myaUser.LastName;
        Bio = myaUser.Bio;
        PictureID = myaUser.PictureID;
        SecurityQ = myaUser.SecurityQ;
        SessionID = myaUser.SessionID;

        // we have a valid user id we can grab the calendars
        if (UserID != 0) {
            // i have to do this manipulation to re-size my array for the proper calendar list size
            authedCalendarIDsRAW = udbConnect.getAuthedCalendarIDs(uID);
            // make sure we have at least 1 calendar id
            if (authedCalendarIDsRAW != "") {
                String delims = "[,]";
                String[] utokenCalendars = authedCalendarIDsRAW.split(delims);
                // stored like: 1,2,3
                tauthedCalendars = utokenCalendars.length;
            }
            adminCalendarIDsRAW = udbConnect.getAdminCalendarIDs(uID);
            if (adminCalendarIDsRAW != "") {
                String delims = "[,]";
                String[] utokenCalendars = adminCalendarIDsRAW.split(delims);
                // stored like: 1,2,3
                tadminCalendars = utokenCalendars.length;
            }

        } else {
            tauthedCalendars = 0;
            tadminCalendars = 0;
        }
    }
}
