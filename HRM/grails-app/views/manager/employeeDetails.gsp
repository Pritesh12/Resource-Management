<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>${employee.company.companyName} | Employee : ${employee.firstName}</title>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="padding:4px; padding-left: 0px; padding-right: 0px">
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${employee.company.companyName} Information</h1></div>
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
    <div class="col-md-12" style="background-color: #f7f6f6; border-radius: 5px">
        <div class="col-md-12" style="padding:0 0 15px 0" align="center">
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px" >First Name</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.firstName}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Last Name</h4></div>
                    <div class="col-md-7" style="padding-top: 10px" >${employee.lastName}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Role</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.roleEmployee.name}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Age</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.age}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Email</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.email}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Phone</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.phone}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Leave</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.employeeLeave.earnLeave}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Used Leave</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.employeeLeave.usedLeave}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5" ><h4 style="color: #666666; margin-bottom: 0px">Address</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${employee.location}</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
