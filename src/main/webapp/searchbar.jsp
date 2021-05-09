

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        
                        if(x === "date"){
                            window.open("date.jsp");
                        }
                        
                        if(x === "eventname"){
                            window.open("eventName.jsp");
                        }
                        else
                            document.getElementById("search").setCustomValidity("Can not find it");
                        
                    }
                    
                    </script>
                </form>

        </div>
    </body>
</html>
