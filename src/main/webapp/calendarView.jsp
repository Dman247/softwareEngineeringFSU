<%-- 
    Document   : calendarAction
    Created on : Mar 20, 2021, 8:35:23 PM
    Author     : mpolloc4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="myBeans.mytUser"
        import="myBeans.mytCalendar"
        import="myBeans.mytEvent"
        import="myBeans.DBconnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            DBconnect dbConnect = new DBconnect();

            // used to store the user id and index of calendar we're looking at
            int iUserID;
            int arrayID = 0;

            // for looping purposes
            int i;

            // used to forward user data
            String sSession = "";
            String CalendarName = "";
            String CalendarNames = "";
            String CalendarInfo = "";
            String sUsers = "";
            String sAdmins = "";

            // used for determinging if we want to grab a specific event or id on page load
            String sGetEventInfo = "";
            String sGetCalendarInfo = "";

            // used to forward event info
            String Event = "";
            String Events = "";
            String EventIDs = "";
            String MyDate = "";
            String MyHourS = "";
            String MyHourF = "";
            String EventInfo = "";
            String EventName = "";

            // will be used to split raw data
            String delims = "[,]";

            //setup vars -- eventually this will be depending on the authed user
            //load all calendarids/names into a dropdown
            //until we connect it to the login servlet we are hardcoding the session
            //currently that session is hard coded for hipposaver
            //potential issue: do we grab by calendars your admin of or calendars you can view?
            //if they dont match you will get different results -> force admins to authed as well
            //sSession = request.getParameter("MySession");
            sSession = "46GyJlT0nv96aLfj";
            iUserID = dbConnect.getUserIDBySession(sSession);
            // validate session to make sure we can grab the info
            if (iUserID != 0) {

                //create a new user object
                
                mytUser umyUser = new mytUser(iUserID);
                //populate based on userid
                //here we populate not only the info but also the calendars they are admin of and authed to view
                //umyUser.getInfo(iUserID);
                
                request.setAttribute("MyUserID", umyUser.getUserID());

                //we have at least 1 calendar
                if (umyUser.gettauthedCalendars() != 0) {
                    String[] utokenCalendars = umyUser.getauthedCalendarIDsRAW().split(delims);
                    mytCalendar umyAuthedCalendar[] = new mytCalendar[umyUser.gettauthedCalendars()];
                    //mytCalendar_1 umyAuthedCalendar[] = new mytCalendar_1[umyUser.gettauthedCalendars()];
                    //mytCalendar_1 umyAuthedCalendar[] = new mytCalendar_1[umyUser.gettauthedCalendars()];
                    //mytCalendar_1 testing = new mytCalendar_1();
                    //testing.setInfo(1);
                    if (utokenCalendars.length > 1) {
                        i = 0;
                        for (i = 0; i < utokenCalendars.length; i++) {
                            //create an array of calendars
                            //loop and populate each calendar the user is an admin of
                            i = 0;
                            for (i = 0; i < umyUser.gettauthedCalendars(); i++) {
                                //set up my calendar info here
                                //umyAuthedCalendar[0].setInfo(Integer.parseInt(utokenCalendars[0]));
                                //umyAuthedCalendar[0].setInfo(1);
                                umyAuthedCalendar[i] = dbConnect.getCalendarInfo(Integer.parseInt(utokenCalendars[i]));
                                // calendar names will be saved for later to produce an easy raw formatted list
                                // of calendar names to populate dropdowns with later
                                CalendarNames = umyAuthedCalendar[i].Name + ", " + CalendarNames;
                            }
                            // removed the last ", " from the list of names
                            CalendarNames = CalendarNames.substring(0, CalendarNames.length() - 2);
                        }
                    } else {
                        //if there is only 1 calendar found just populate the single calendar
                        umyAuthedCalendar[0] = dbConnect.getCalendarInfo(Integer.parseInt(utokenCalendars[0]));
                    }

                    //we've already verified that at least 1 calendar exists so this should always retrieve a calendar to default to
                    //if GetCalendarInfo = 1 we are grabbing a specific calendars info
                    sGetCalendarInfo = request.getParameter("GetCalendarInfo");
                    if (Integer.parseInt(sGetCalendarInfo) == 1) {
                        CalendarName = request.getParameter("GCalendarName");
                        //loop through all our calendars to grab the index of the right calendar array
                        //based on calendar name
                        for (i = 0; i < umyUser.gettauthedCalendars(); i++) {

                            if (umyAuthedCalendar[i].Name.equals(CalendarName)) {
                                // we now know which calendar index we're using
                                arrayID = i;
                            }
                        }
                    } else {
                        //if we arent looking for a specific calendar we load the first in the array
                        //we know we're dealing with index 0
                        arrayID = 0;
                        CalendarName = umyAuthedCalendar[0].Name;
                    }

                    CalendarInfo = umyAuthedCalendar[arrayID].Info;

                    //checking authed users for the calendar
                    //setup userids then resolve names
                    //assumes every calendar has a user authed
                    sUsers = umyAuthedCalendar[arrayID].authedUsersRAW;
                    String[] utokenUsers = sUsers.split(delims);
                    sUsers = "";
                    //if there are more than 1 usder authed to view the calendar setup the string for parsing
                    //user1, user2, user3
                    if (utokenUsers.length > 1) {
                        for (i = 0; i < utokenUsers.length; i++) {
                            if (utokenUsers[i] != "") {
                                sUsers = sUsers + dbConnect.getUserNameByID(Integer.parseInt(utokenUsers[i])) + ", ";
                            }
                        }
                        sUsers = sUsers.substring(0, sUsers.length() - 2);
                    } else {
                        //else set it to the only id authed
                        sUsers = dbConnect.getUserNameByID(Integer.parseInt(utokenUsers[0]));
                    }

                    //checking admin users for the calendar
                    sAdmins = umyAuthedCalendar[arrayID].adminUsersRAW;
                    String[] utokenAdmins = sAdmins.split(delims);
                    sAdmins = "";
                    // if there are more than 1 admin get the string ready
                    if (utokenAdmins.length > 1) {

                        for (i = 0; i < utokenAdmins.length; i++) {
                            if (utokenAdmins[i] != "") {
                                sAdmins = sAdmins + dbConnect.getUserNameByID(Integer.parseInt(utokenAdmins[i])) + ", ";
                            }
                        }
                        sAdmins = sAdmins.substring(0, sAdmins.length() - 2);
                    } else {
                        //only 1 admin
                        sAdmins = dbConnect.getUserNameByID(Integer.parseInt(utokenAdmins[0]));
                    }

                    //get events for the calendar
                    //event1,event2,event3
                    Events = umyAuthedCalendar[arrayID].eventIDsRAW;

                    //if we have at least 1 event in the calendar we can get the info
                    if (Events != "") {
                        //store event IDs the same way for later parsing
                        EventIDs = Events;
                        String[] utokenEvents = Events.split(delims);
                        Events = "";

                        //if there is more than 1 event in that calendar
                        if (utokenEvents.length > 1) {
                            for (i = 0; i < utokenEvents.length; i++) {
                                if (utokenEvents[i] != "") {
                                    Events = Events + dbConnect.getEventNameByID(Integer.parseInt(utokenEvents[i])) + ", ";
                                }
                            }
                            Events = Events.substring(0, Events.length() - 2);

                        } else {
                            // we only have 1 event in the calendar
                            Events = dbConnect.getEventNameByID(Integer.parseInt(utokenEvents[0]));
                        }

                        // hackey method so i only look for the information of an event if we want
                        // not every time we submit
                        sGetEventInfo = request.getParameter("GetEventInfo");
                        if (Integer.parseInt(sGetEventInfo) == 1) {
                            //get the date
                            Event = request.getParameter("EventID");
                            mytEvent umyEvent = new mytEvent(Integer.valueOf(Event));

                            //MyDate = dbConnect.getEventDateByID(Integer.parseInt(Event));
                            MyDate = umyEvent.getDate();
                            request.setAttribute("MyEventDate", MyDate);

                            //get the hours
                            MyHourS = umyEvent.getHourStart();
                            MyHourF = umyEvent.getHourFinish();
                            request.setAttribute("MyEventS", MyHourS);
                            request.setAttribute("MyEventF", MyHourF);

                            //get name
                            EventName = umyEvent.getEventName();
                            request.setAttribute("MyEventName", EventName);

                            //get info
                            EventInfo = umyEvent.getInfo();
                            request.setAttribute("MyEventInfo", EventInfo);
                        }
                    }

                } else {
                    // no calendar name found - this means the user has no calendars it can view
                    CalendarName = "No calendars found for user";
                    CalendarNames = "No calendars found for user";
                    CalendarInfo = "No calendars found for user";
                    sUsers = "No calendars found for user";
                    sAdmins = "No calendars found for user";
                    Events = "No events found for user";
                    EventIDs = "";
                }

            } else {
                // no valid session data found
                CalendarName = "Invalid session data - please re-login";
                CalendarNames = "Invalid session data - please re-login";
                CalendarInfo = "Invalid session data - please re-login";
                sUsers = "Invalid session data - please re-login";
                sAdmins = "Invalid session data - please re-login";
                Events = "Invalid session data - please re-login";
                EventIDs = "";
            }

            request.setAttribute("MyCNames", CalendarNames);
            request.setAttribute("MyUsernames", sUsers);
            request.setAttribute("MyAdmins", sAdmins);
            request.setAttribute("MyEvent", Events);
            request.setAttribute("MyEventIDs", EventIDs);
            request.setAttribute("MyCInfo", CalendarInfo);
            request.setAttribute("MyCName", CalendarName);

            request.getRequestDispatcher("ViewCalendar.jsp").forward(request, response);
            response.sendRedirect("ViewCalendar.jsp");
        %>

    </body>
</html>