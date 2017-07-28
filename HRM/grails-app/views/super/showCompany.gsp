<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | ${company.companyName}</title>
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName} Information</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdmin">Home</g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newCompany">Add Company</g:link></li>
                    <li><g:link class="list" controller="super" action="company">Company List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Module<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newModule">Add Module</g:link></li>
                    <li><g:link controller="super" action="module">Module List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Role<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newRole">Add Role</g:link></li>
                    <li><g:link controller="super" action="role">Role List</g:link></li>
                </ul>
            </li>
        </ul><br>
    </div>
    <div class="col-md-12" style="background-color: #f7f6f6; border-radius: 5px">
        <div class="col-md-12" style="padding:0 0 0 0" align="center">
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px" >Name</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.companyName}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Tax Id.</h4></div>
                    <div class="col-md-7" style="padding-top: 10px" >${company.taxId}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Status</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.companyStatus}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Total Employee</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.employees.size()}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Registration No.</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.registrationNo}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Email</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.email}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Phone</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.phone}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Address</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.address}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5" ><h4 style="color: #666666; margin-bottom: 0px">City</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.city}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">State</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.state}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Country</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.country}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Leave Rate</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.leaveRate}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Maximum Leave</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.maxLeave}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Created By</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.createdBy}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Create Date</h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.createdDate}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <g:if test="${!(company.modifiedBy.equals(null))}">
                    <div class="col-md-4" style="padding-top: 10px">
                        <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Modified By</h4></div>
                        <div class="col-md-7" style="padding-top: 10px">${company.modifiedBy}</div>
                    </div>
                </g:if>
                <g:if test="${!(company.modifiedDate.equals(null))}">
                    <div class="col-md-4" style="padding-top: 10px">
                        <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px">Modify Date</h4></div>
                        <div class="col-md-7" style="padding-top: 10px">${company.modifiedDate}</div>
                    </div>
                </g:if>
            </div>
        </div>
        <div class="col-md-12" style="padding-bottom:10px" align="center">
            <hr>
            <h4 style="color: #2b406e">Module(s)</h4><hr>
            <g:if test="${company.modules.size() > 0}">
                <g:each in="${company.modules.moduleName.sort()}" var="mod" status="i">
                    <p style="color: #204060">${mod}</p>
                </g:each>
            </g:if>
            %{--<%if(modules!=null){
                for(String mod : modules.sort()){ %>
            <p style="color: #204060"><%=mod%></p>
            <%}}%>--}%
        </div>
    </div>
</div>
</body>
</html>
