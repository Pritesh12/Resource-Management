<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | HOME</title>
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

<div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">Company Information</h1></div>
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
<div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Company Name</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=taxId&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Tax Id</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Company Status</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=registrationNo&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Registration No</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=totalEmployee&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Total Employee</a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=email&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Email</a></div>

</div>
<g:form name="showForm" controller="super" action="modifyCompany">
    <g:each in="${companyData}" var="company" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"align="center"><input type="radio" required name="id" value="${company.id}"></div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${company.companyName}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.taxId}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.companyStatus}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.registrationNo}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.employees.size()}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${company.email}</div>
        </div>
    </g:each>

    <g:if test="${companyData.size() > 0}">
        <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
            %{--<input type="hidden" name="id" value="">--}%
            <input type="submit" class="btn btn-success" name="modify" value="Show">
            <input type="submit" class="btn btn-warning" name="modify" value="Edit">
            <input type="submit" class="btn btn-danger"  name="modify" value="Delete">
        </div>
    </g:if>

    <div class="pagination" role="status" aria-live="polite" style="float: left">Showing ${from} to ${to} of ${companyCount} entries</div>
    <div class="pagination" style="float: right">
        <li><g:paginate class="row" style="text-align: center; display: inline;" next="Next" prev="Previous" maxsteps="0" controller="Secure" action="list" total="${companyCount}"/>
    </div>
    </div>

</g:form>
</div>
</body>
</html>