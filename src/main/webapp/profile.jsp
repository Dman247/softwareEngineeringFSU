<head>
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="container">
        <div class="jumbotron text-center">
            <h1>Calendar App - Profile</h1>
        </div>
        <%@include file="navBar.jsp" %>
        <br>
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638__340.png" class="rounded" width="150">
                            <div class="mt-3">
                                <h4>${firstName}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${firstName} ${lastName}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${email}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Bio</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${bio}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <%@include file="footer.jsp" %>
</div>
</body>