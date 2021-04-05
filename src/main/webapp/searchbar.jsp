

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
                        <div class="searchbox w3-right">
            <form>
                <input type="text" placeholder=" Type here " name="search">
                <a href="queryAvtion.jsp"><button type="submit">Search</button></a>
                </form>

        
    </body>
</html>
