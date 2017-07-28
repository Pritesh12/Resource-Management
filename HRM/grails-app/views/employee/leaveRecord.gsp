<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>${employee.company.companyName} | Leave History</title>
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${employee.company.companyName} | Assets</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure">Home</g:link></li>
            <li><g:link class="home" controller="holiday" action="holiday">Holiday</g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Leave<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="employee" action="leave">Request Leave</g:link></li>
                    <li><g:link controller="employee" action="leaveRecord">Leave History</g:link></li>
                </ul>
            </li>
        </ul><br>
    </div>
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
        <div class="col-sm-1"></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px;"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">From</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px;"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">To</a></div>
        <div class="col-sm-1" style="border:1px solid white; padding: 10px;"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Days</a></div>
        <div class="col-sm-3" style="border:1px solid white; padding: 10px;"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Reason</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px;"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Status</a></div>
    </div>
    <g:each in="${employee.leaves.sort{it.fromDate.reverse()}}" var="leave" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-1"></div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${leave.fromDate}</div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${leave.toDate}</div>
            <div class="col-sm-1" style="padding: 0 0 0 5px">${leave.days}</div>
            <div class="col-sm-3" style="padding: 0 0 0 5px">${leave.reason}</div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">
                <g:if test="${leave.status.equals("Pending")}">
                    <p style="background-color:#f28c38;margin-bottom: 0px">${leave.status}</p>
                </g:if>
                <g:if test="${leave.status.equals("Approved")}">
                    <p style="background-color:#70db70;margin-bottom: 0px">${leave.status}</p>
                </g:if>
                <g:if test="${leave.status.equals("Denied")}">
                    <p style="background-color:#ff6666;margin-bottom: 0px">${leave.status}</p>
                </g:if>
            </div>
            <div class="col-sm-1"></div>
        </div>
    </g:each>
</div>
</body>
</html>