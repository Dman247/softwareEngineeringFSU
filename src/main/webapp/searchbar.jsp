

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBconnect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .searchbox {
                float: left;
            }
            input[type=text]{
                padding:6px;
                margin-top: 8px;
                font-size:17px;
                border: none;
            }
            .searchbox button {
                padding:8px;
                margin-top: 10px;
                background: gray;
                font-size: 20px;
                border: none;
                cursor: pointer;
            }
            .searchbox button:hover {
                background: blue;
            }
        
        </style>

    </head>
    <body>
        
        <%@include file="header.jsp" %>
            <%@include file="navBar.jsp" %>
                        <div class="searchbox w3-right">
            <form>
                <input type="search" placeholder=" Type here " name="search" id="search" onchange="openPage()" value="">
                <a href="queryAvtion.jsp"><button type="submit">Search</button></a>
                <script>
                    function openPage(){
                        var x = document.getElementById("search").value;
                        
                        if(x === "hiking"){
                            window.open("hikingAction.jsp");
                        }
                        
                        if(x === "graduation"){
                            window.open("graduationAction.jsp");
                        }
                        
                        if(x === "class"){
                            window.open("classAction.jsp");
                        }
                        
                        if(x === "appointment"){
                            window.open("appointmentAction.jsp");
                        }
                        
                        if(x === "high school"){
                            window.open("hgraduationAction.jsp");
                        }
                        
                        if(x === "middle school"){
                            window.open("mgraduationAction.jsp");
                        }
                        
                        
                        else
                            document.getElementById("search").setCustomValidity("We cannot find the event");
                        
                    }
                    
                    </script>
                </form>

        </div>
    </body>
</html>
