<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>${companyName} | Holidays</title>

</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Human Resource Management </h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>

        </div>
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana">${companyName} | Holidays</h1>
    </div>
    <div>
        <ul class="nav nav-tabs">
            <ul class="nav nav-tabs">
                <li><g:link class="home" controller="secure">Home</g:link></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Leave<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="employee" action="leave">Request Leave</g:link></li>
                        <li><g:link controller="employee" action="leaveRecord">Leave History</g:link></li>
                    </ul>
                </li>
            </ul>
        </ul>
    </div>
    <div class="col-sm-12">
        <div class="col-sm-4"></div>
        <div class="col-sm-4" style="padding: 0 0 0 0; background-color: #f28c38; color: white">
            <div class="col-sm-4" style="border:1px solid white; padding: 10px" align="center">Date</div>
            <div class="col-sm-8" style="border:1px solid white; padding: 10px 10px 10px 20px">Title</div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="col-sm-4"></div>
        <div class="col-sm-4" style="background-color: #f2f2f2; padding: 0 0 0 0">
            <g:if test="${holidays.size()>0}">
                <g:each in="${holidays.sort{it.holidayDate}}" var="holiday" status="j">
                    <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                        <div class="col-sm-4" style="padding: 0 0 0 5px" align="center">${holiday.holidayDate}</div>
                        <div class="col-sm-8" style="padding: 0 0 0 15px">${holiday.title}</div>
                    </div>
                </g:each>
            </g:if>
            <g:else>
                <center><h4>Till now no data available for this year</h4></center>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>