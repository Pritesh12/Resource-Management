<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${manager.company.companyName} | Leave Action</title>
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana "> ${manager.company.companyName} | Home</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure">Home</g:link></li>
            <li><g:link class="home" controller="manager" action="employees">Employees</g:link></li>
            <li><g:link class="home" controller="manager" action="holiday" >Holidays</g:link></li>
            <li><g:link class="home" controller="manager" action="leaveAction">Leaves<g:if test="${leaveCount > 0}"><span class="badge badge-notify" style="background-color: red; margin-bottom: 10px; padding-left: 5px; padding-right:6px">${leaveCount}</span></g:if></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Asset<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="manager" action="assignAsset">Assign Asset</g:link></li>
                    <li><g:link controller="manager" action="assets">Asset List</g:link></li>
                </ul>
            </li>
        </ul><br>
    </div>
    <g:form name="showForm" controller="manager" action="saveLeaveAction">
        <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
        </div>
        <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
            <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">First Name</a></div>
            <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Last Name</a></div>
            <div class="col-sm-1" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Employee Id</a></div>
            <div class="col-sm-3" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Email</a></div>
            <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Location</a></div>
            <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Leave Action</a></div>
        </div>
        <g:if test="${leaveCount > 0}">
        <g:each in="${manager.employees}" var="employee" status="i">
            <g:each in="${employee.leaves}" var="leave" status="j">
                <g:if test="${leave.status.equals('Pending')}">
                    <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                        <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.firstName}</div>
                        <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.lastName}</div>
                        <div class="col-sm-1" style="padding: 0 0 0 10px;">${employee.id}</div>
                        <div class="col-sm-3" style="padding: 0 0 0 10px;">${employee.email}</div>
                        <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.location}</div>
                        <div class="col-sm-2" style="padding: 0 0 0 10px;">
                            <select ng-model='discussionsSelect' class='form-control' name="id">
                                <option value='${leave.id}-Pending'>Pending</option>
                                <option value='${leave.id}-Approved'>Approve</option>
                                <option value='${leave.id}-Denied'>Deny</option>
                            </select>
                        </div>
                        <div class="col-sm-2" style="padding: 0 0 0 10px;">
                        </div>
                    </div>
                </g:if>
            </g:each>
        </g:each>
        <div class="top, col-sm-12" style="padding: 20px; background-color: white">
            <input type="submit" class="btn btn-success" name="modify" value="Apply">
        </div>
        </g:if>
    </g:form>
    <div class="col-sm-12">
        <fieldset>Leave History</fieldset>
    </div>
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">First Name</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Last Name</a></div>
        <div class="col-sm-1" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Employee Id</a></div>
        <div class="col-sm-3" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Email</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Location</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Leave Status</a></div>
    </div>
    <g:each in="${manager.employees}" var="employee" status="i">
        <g:each in="${employee.leaves}" var="leave" status="j">
            <g:if test="${!(leave.status.equals('Pending'))}">
                <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.firstName}</div>
                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.lastName}</div>
                    <div class="col-sm-1" style="padding: 0 0 0 10px;">${employee.id}</div>
                    <div class="col-sm-3" style="padding: 0 0 0 10px;">${employee.email}</div>
                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.location}</div>
                    <div class="col-sm-2" style="padding: 0 0 0 10px;">
                        <g:if test="${leave.status.equals("Approved")}">
                            <p style="background-color:#70db70;margin-bottom: 0px">${leave.status}</p>
                        </g:if>
                        <g:if test="${leave.status.equals("Denied")}">
                            <p style="background-color:#ff6666;margin-bottom: 0px">${leave.status}</p>
                        </g:if>
                    </div>
                </div>
            </g:if>
        </g:each>
    </g:each>
</div>
</body>
</html>