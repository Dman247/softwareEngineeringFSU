<%-- 
    Document   : calendarAction
    Created on : Mar 20, 2021, 8:35:23 PM
    Author     : mpolloc4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
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
            String CalendarIDs = "";
            String CalendarName = "";
            String CalendarNames = "";
            String CalendarNameTest = "";
            String sSession = "";
            String CalendarInfo = "";
            String sGetEventInfo = "";
            String sGetCalendarInfo = "";
            String sUsers = "";
            String sAdmins = "";
            int CalendarID;
            String Event = "";
            String Events = "";
            String EventIDs = "";
            String MyDate = "";
            String MyHourS = "";
            String MyHourF = "";
            String Events2 = "";
            String sql;
            String delims = "[,]+";
            int i;

            //setup vars -- eventually this will be depending on the authed user
            //load all calendarids/names into a dropdown
            //until we connect it to the login servlet we are hardcoding the session
            //currently that session is hard coded for hipposaver
            //potential issue: do we grab by calendars your admin of or calendars you can view?
            //if they dont match you will get different results -> force admins to authed as well
            request.setAttribute("MySession", "JkL00NVMaaz3wr3z");
            sSession = "JkL00NVMaaz3wr3z";

            // validate session to make sure we can grab the info
            if (sSession != "") {
                CalendarIDs = dbConnect.getCalendarIDsbyUserID(dbConnect.getUserIDBySession("JkL00NVMaaz3wr3z"));
                //CalendarIDs = dbConnect.getCalendarIDsbyUserID(3);
                //if there are no calendars the CalendarIDs = ""
                if (CalendarIDs != "") {
                    String[] utokenCalendars = CalendarIDs.split(delims);
                    //if there is more than 1 calendar we need to setup the string
                    CalendarNames = "";
                    if (utokenCalendars.length > 1) {
                        for (i = 0; i < utokenCalendars.length; i++) {
                            CalendarNames = CalendarNames + dbConnect.getCalendarNameByID(Integer.parseInt(utokenCalendars[i])) + ", ";
                        }
                        //remove the last ", "
                        CalendarNames = CalendarNames.substring(0, CalendarNames.length() - 2);
                    } else {
                        //if there is only 1 calendar found just populate the single calendar
                        CalendarNames = dbConnect.getCalendarNameByID(Integer.parseInt(utokenCalendars[0]));
                    }
                } else {
                    CalendarNames = "";
                }

                //as long as we've found a calendar name we can populate the information
                if (CalendarNames != "") {

                    //isolate the first calendar to load into the dropdown
                    String[] utokenCalendarsName = CalendarNames.split(delims);
                    //we've already verified that at least 1 calendar exists so this should always retrieve a calendar to default to
                    //if GetCalendarInfo = 1 we are grabbing a specific calendars info
                    sGetCalendarInfo = request.getParameter("GetCalendarInfo");
                    if (Integer.parseInt(sGetCalendarInfo) == 1) {
                        CalendarName = request.getParameter("GCalendarName");
                    } else {
                        //if we arent looking for a specific calendar we load the first in the array
                        CalendarName = utokenCalendarsName[0];
                    }
                    CalendarID = dbConnect.getCalendarIDByName(CalendarName);
                    CalendarInfo = dbConnect.getCalendarInfoByID(CalendarID);

                    //checking authed users for the calendar
                    //setup userids then resolve names
                    //assumes every calendar has a user authed
                    sUsers = dbConnect.getCalendarUsersByCalendarID(CalendarID);
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
                    sAdmins = dbConnect.getCalendarAdminsByCalendarID(CalendarID);
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
                    Events = dbConnect.getEventsByCalendarID(CalendarID);

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
                            MyDate = dbConnect.getEventDateByID(Integer.parseInt(Event));
                            request.setAttribute("MyEventDate", MyDate);

                            //get the hours
                            MyHourS = dbConnect.getEventHourStartByID(Integer.parseInt(Event));
                            MyHourF = dbConnect.getEventHourFinishByID(Integer.parseInt(Event));
                            request.setAttribute("MyEventS", MyHourS);
                            request.setAttribute("MyEventF", MyHourF);
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