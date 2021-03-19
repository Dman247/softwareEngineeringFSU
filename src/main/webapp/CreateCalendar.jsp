<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <!-- bootsrap css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar App</title>
    </head>
    <body>
        <!-- bootstrap java -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <div class="container">
            <div class="jumbotron text-center">
                <h1>Calendar App - Create Calendar</h1>
            </div>
            <div class="container">
                <form action="/CreateCalendar.php">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label from="CName">Calendar Name:</label>
                            <input type="text" class="form-control" id="CName" placeholder="My Calendar">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                           <label from="CName">Calendar Admins (seperated by commas):</label>
                            <input type="text" class="form-control" id="CName" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                           <label from="CName">Calendar Users (seperated by commas):</label>
                            <input type="text" class="form-control" id="CName" placeholder="user@email.com, user1@email.com">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary btn-block">Create Calendar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
