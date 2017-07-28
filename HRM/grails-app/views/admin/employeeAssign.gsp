<%@ page import="com.hrm.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <asset:stylesheet src="search_option_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | ${employee.company.companyName}</title>
    <g:javascript>

        function myFunction() {

            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
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

<div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;padding:  0 0 10px 0;font-size:20px;font-family:Verdana ">${employee.company.companyName} | Manager</h1></div>
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
</div>
<div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 5px; padding-bottom: 0px">
<div class="inner" style="font-size:20px;height: auto">

        <fieldset>Basic Details</fieldset>
        <hr>
        </div>
            <div>
            <div class="col-md-12" style="padding: 0px 0 0px 0" >
                <div class="col-md-6" style="padding: 5px" >
                    <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                        <p style="padding-right:10px"><b>Name</b></p>
                    </div>
                    <div class="col-md-8">${employee.firstName}</div>
                </div>
            </div>
        <div class="col-md-12" style="padding: 0px 0 0px 0" >
            <div class="col-md-6" style="padding: 5px" >
                <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                    <p style="padding-right:10px"><b>ID</b></p>
                </div>
                <div class="col-md-8">${employee.id}</div>
            </div>
        </div>

        <div class="col-md-6" style="padding: 5px">
            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                <p style="padding-right:10px"><b>Email</b></p>
            </div>
            <div class="col-md-8">
                ${employee.email}
            </div>
        </div>
        <div class="col-md-12" style="padding: 0px 0 0px 0">
            <div class="col-md-6"  style="padding: 5px">
                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                    <p style="padding-right:10px"><b>Phone</b></p>
                </div>
                <div class="col-md-8">
                    ${employee.phone}
                </div>
            </div>
        </div>
        <div class="col-md-12" style="padding: 0px 0 0px 0">
            <div class="col-md-6"  style="padding: 5px">
                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                    <p style="padding-right:10px"><b>Address</b></p>
                </div>
                <div class="col-md-8">
                    ${employee.location}
                </div>
            </div>
        </div>

                <g:if test="${employee.employees.size()>0}">
                    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
                        <hr style="margin-top: 10px; margin-bottom: 10px">
                        <fieldset style="font-size: 20px; height: auto; padding-left: 15px">Assigned Employees</fieldset>

                        <div class="col-md-12" style="padding: 0 0 0 0">
                            <hr style="margin-top: 10px; margin-bottom: 10px">
                        </div>
                        <div class="col-md-12" style="padding: 5px 0 5px 0; background-color: #f28c38; color: white">
                            <div class="col-md-2" >First Name</div>
                            <div class="col-md-2">Last Name</div>
                            <div class="col-md-2">Employee Id</div>
                            <div class="col-md-2">Email</div>
                            <div class="col-md-2">Location</div>
                        </div>
                        <g:form controller="admin" action="saveEmployeeToManager" >
                            <g:each in="${employee.employees}" var="emp" status="i">
                                <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                                    <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                                        <div class="col-sm-1" style=" padding: 0 0 0 10px">
                                            <input type="checkbox" name="emplist" value="${emp.id}">
                                        </div>
                                        <div class="col-sm-9" style=" padding: 0 0 0 15px">${emp.firstName}</div>
                                    </div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${emp.lastName}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${emp.id}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${emp.email}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${emp.location}</div>
                                </div>
                            </g:each>
                            <div class="top, col-sm-12" style="padding: 5px 20px 5px 2px" width="100px" align="left">
                                <input type="hidden" name="id" value="${employee.id}" >
                                <input type="submit" class="btn btn-success" name="act" value="Remove" >
                            </div>
                        </g:form>
                    </div>
                </g:if>

        <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
            <div class="inner" style="font-size:20px;height: auto;padding: 0 0 0 0;margin: 0 0 0 0">
                <hr>
                <fieldset> Available Employees
                    <input type="text" id="myInput" onkeyup="myFunction()" style="border-radius:10px; float: right" placeholder="Search for names..." title="Type in a name">
                </fieldset>
            </div>
        </div>

    %{-- employee details of a particular company --}%
        <div class="col-md-12" style="padding: 10px 0 10px 0;">
        </div>
    <g:form controller="admin" action="saveEmployeeToManager">
        <table id="myTable" class="table">
            <tr class="thead-default" style="background-color: #f28c38;color: white">
                <th>First Name</th>
                <th>Last Name</th>
                <th>Employee Id</th>
                <th>Location</th>
                <th>Email</th>
            </tr>
            <g:each in="${employee.company.employees}" var="emp" status="i">
                <g:if test="${emp.roleEmployee.accessibility.equals('low') && (com.hrm.Employee.findManagerByEmployee(emp.id).get() == null)}">
                    <tr>
                        <td>
                            <input type="checkbox" id="emplist${i}" name="emplist" value="${emp.id}"/>&#160;&#160;&#160;&#160;
                            ${emp.firstName}</td>
                        <td>${emp.lastName}</td>
                        <td>${emp.id}</td>
                        <td>${emp.location}</td>
                        <td>${emp.email}</td>
                    </tr>
                </g:if>
            </g:each>
        </table>
        <div class="top, col-sm-12" style="padding: 5px 20px 30px 2px" width="100px" align="left">
            <input type="hidden" name="id" value="${employee.id}" >
            <input type="submit" class="btn btn-success" name="act" value="Add" >
        </div>
    </g:form>
</div>
</div>
</div>
</body>
</html>