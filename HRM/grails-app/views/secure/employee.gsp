<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${company.companyName} | Home</title>
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName}</h1></div>
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
    </ul>

    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
    <div class="inner" style="font-size:20px;height: auto">
        <g:form>
            <fieldset>Company Info</fieldset>
            <hr>
            </div>
                <div>

                <div class="col-md-12" style="padding: 0px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px"><b>Name</b></p>
                        </div>
                        <div class="col-md-8">
            ${company.companyName}
            </div>
        </div>
    </div>

            <div class="col-md-6" style="padding: 5px">
                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                    <p style="padding-right:10px"><b>Email</b></p>
                </div>
                <div class="col-md-8">
                    ${company.email}
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 10px 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>Phone</b></p>
                    </div>
                    <div class="col-md-8">
                        ${company.phone}
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 10px 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>Address</b></p>
                    </div>
                    <div class="col-md-8">
                        ${company.address}
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 10px 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>City</b></p>
                    </div>
                    <div class="col-md-8">
                        ${company.city}
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 10px 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>State</b></p>
                    </div>
                    <div class="col-md-8">
                        ${company.state}
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 0px 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>Country</b></p>
                    </div>
                    <div class="col-md-8">
                        ${company.country}
                    </div>
                </div>
            </div>
            <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
                <div class="inner" style="font-size:20px;height: auto;padding: 0 0 0 0">
                    <hr>
                    <fieldset>Personal Information</fieldset>
                    <hr>
                </div>
            </div>
            <div class="col-md-12" style="padding: 10px 0 10px 0;margin: 0 0 0 0;">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>Name</b></p>
                    </div>
                    <div class="col-md-8">
            ${employee.firstName} ${employee.middleName} ${employee.lastName}
            </div>
        </div>
            <div class="col-md-12" style="padding: 5px 0 5px 0;margin: 0 0 0 0">
                <div class="col-md-6"  style="padding: 5px">
                    <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                        <p style="padding-right:10px"><b>Email</b></p>
                    </div>
                    <div class="col-md-8">
                        ${employee.email}
                    </div>
                </div>
                <div class="col-md-12" style="padding: 5px 0 5px 0;margin: 0 0 0 0">
                    <div class="col-md-6"  style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><b>Phone</b></p>
                        </div>
                        <div class="col-md-8">
                            ${employee.phone}
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 5px 0 5px 0;margin: 0 0 0 0">
                        <div class="col-md-6"  style="padding: 5px">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px"><b>Address</b></p>
                            </div>
                            <div class="col-md-8">
                                ${employee.location}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 5px 0 5px 0;margin: 0 0 0 0">
                        <div class="col-md-6"  style="padding: 5px">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px"><b>Remaining Leave</b></p>
                            </div>
                            <div class="col-md-8">
                                ${employee.employeeLeave.earnLeave}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="padding: 5px 0 5px 0;margin: 0 0 0 0">
                        <div class="col-md-6"  style="padding: 5px">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px"><b>Total Used Leave</b></p>
                            </div>
                            <div class="col-md-8">
                                ${employee.employeeLeave.usedLeave}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
    </div>
    </div>
</div>
</body>
</html>