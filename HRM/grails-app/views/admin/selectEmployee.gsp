<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | ${company.companyName} | Select Employee</title>

    <g:javascript>
        window.onload=function(){
        var k=0;
        }
        function fun() {
            <g:if test="${company.employees.size()>0}">
        <g:each var="i" in="${ (0..<company.employees.size()) }">
            if(document.getElementById('row${i}').checked == 1){
                        document.getElementById('role${i}').disabled = 0;
                    }else{
                        document.getElementById('role${i}').disabled = 1
                    }
        </g:each>
    </g:if>
        }
    </g:javascript>

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

<div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">Role Assign</h1></div>
<div>
    <ul class="nav nav-tabs">
        <li><g:link class="home" controller="secure">Home</g:link></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Employee <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="admin" action="newEmployee">Add Employee</g:link></li>
                <li><g:link class="list" controller="admin" action="employee">Employee List</g:link></li>
                <li><g:link class="list" controller="admin" action="roleAssign">Role Assign</g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Holiday <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="holiday" action="newHoliday">Add Holiday</g:link></li>
                <li><g:link class="list" controller="holiday" action="holiday">Holiday List</g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Asset <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="asset" action="newAsset">Add Asset</g:link></li>
                <li><g:link class="list" controller="asset" action="assets">Assets</g:link></li>
                <li><g:link class="list" controller="asset" action="assignAsset">Assign Assets</g:link></li>
            </ul>
        </li>
    </ul><br>
</div><div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">First Name</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Last Name</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Email</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Location</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Employee Id</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none">Role Assign</a></div>
</div>

%{-- Fetching employee information --}%
<g:form controller="admin"  action="selectAction">
    <g:each in="${company.employees}" var="employee" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"align="center">
                    <input type="radio" id="row${i}" name="id" required value="${employee.id}" id="radioButton" onchange="fun()">
                </div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${employee.firstName}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.lastName}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.email}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.location}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.id}</div>
            <div class="col-sm-2" style="padding: 0 0 0 0px;">
                %{-- Select option to assign role--}%
                <g:select disabled="true" class="form-control" name="role${employee.id}" id="role${i}" from="${roles}" value="${employee.roleEmployee.name}" optionKey="name" optionValue="name"/>
            </div>
        </div>
    </g:each>
    <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Save" >
        <input type="submit" class="btn btn-warning" name="modify" value="Show" >
    </div>

%{-- Pagination --}%
</g:form>
</div>

</body>
</html>