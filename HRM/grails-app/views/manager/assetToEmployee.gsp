<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <asset:stylesheet src="search_option_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | ${employee.company.companyName} | Assign Asset</title>
</head>
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
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${employee.company.companyName} | Select Asset</h1></div>
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

    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 5px; padding-bottom: 0px">
        <div class="inner" style="font-size:20px;height: auto">
            <fieldset>Employee Details</fieldset>
            <hr style="margin-top: 10px; margin-bottom: 10px">
        </div>
        <div>
            <div class="col-md-12" style="padding: 0px 0 0px 0" >
                <div class="col-md-6" style="padding: 5px" >
                    <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                        <p style="padding-right:10px"><b>Name:</b></p>
                    </div>
                    <div class="col-md-8">${employee.firstName} ${employee.middleName} ${employee.lastName}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 0px 0 0px 0" >
                <div class="col-md-6" style="padding: 5px" >
                    <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                        <p style="padding-right:10px"><b>Employee ID:</b></p>
                    </div>
                    <div class="col-md-8">${employee.id}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 0px 0 0px 0" >
                <div class="col-md-6" style="padding: 5px" >
                    <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                        <p style="padding-right:10px"><b>Role:</b></p>
                    </div>
                    <div class="col-md-8">${employee.roleEmployee.name}</div>
                </div>
            </div>
            <g:if test="${employee.assets.size()>0}">
                <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
                    <hr style="margin-top: 10px; margin-bottom: 10px">
                    <fieldset style="font-size: 20px; height: auto; padding-left: 15px">Assigned Assets</fieldset>

                    <div class="col-md-12" style="padding: 0 0 0 0">
                        <hr style="margin-top: 10px; margin-bottom: 10px">
                    </div>
                    <div class="col-md-12" style="padding: 5px 0 5px 0; background-color: #f28c38; color: white">
                        <div class="col-md-2" >Product Name</div>
                        <div class="col-md-2">Product Id</div>
                        <div class="col-md-2">Serial No</div>
                        <div class="col-md-2">Product Type</div>
                        <div class="col-md-2">Issue Date</div>
                    </div>
                    <g:form controller="manager" action="saveAssetToEmploye" >
                        <g:each in="${employee.assets.sort{it.id}}" var="asset" status="i">
                            <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                                <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                                    <div class="col-sm-1" style=" padding: 0 0 0 10px">
                                        <input type="checkbox" name="assetId" value="${asset.id}">
                                    </div>
                                    <div class="col-sm-9" style=" padding: 0 0 0 15px">${asset.name}</div>
                                </div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.productID}</div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.serialNo}</div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.type}</div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.issueDate}</div>
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
                <hr style="margin-top: 10px; margin-bottom: 10px">
                <div class="col-md-6"><fieldset style="font-size: 20px; height: auto">Available Assets</fieldset></div>
                <div class="col-md-6"><input type="text" id="myInput" onkeyup="myFunction()" style="float: right" placeholder="Search for product..." title="Type in a name"></div>

                <div class="col-md-12" style="padding: 0 0 0 0">
                    <hr style="margin-top: 10px; margin-bottom: 10px">
                </div>
                <div class="col-md-12" style="padding: 5px 0 5px 0; background-color: #f28c38; color: white">
                    <div class="col-md-2" >Product Name</div>
                    <div class="col-md-2">Product Id</div>
                    <div class="col-md-2">Serial No</div>
                    <div class="col-md-2">Product Type</div>
                </div>
                <g:form controller="manager" action="saveAssetToEmploye" >
                    <g:each in="${employee.company.assets.sort{it.id}}" var="asset" status="i">
                        <g:if test="${asset.employee == null}">
                    %{--<g:if test="${!(employee.assets.contains(asset))}">--}%
                            <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                                <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                                    <div class="col-sm-1" style=" padding: 0 0 0 10px">
                                        <input type="checkbox" name="assetId" value="${asset.id}">
                                    </div>
                                    <div class="col-sm-9" style=" padding: 0 0 0 15px">${asset.name}</div>
                                </div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.productID}</div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.serialNo}</div>
                                <div class="col-sm-2" style="padding: 0 0 0 10px;">${asset.type}</div>
                            </div>
                        </g:if>
                    </g:each>
                    <div class="top, col-sm-12" style="padding: 5px 20px 15px 2px" width="100px" align="left">
                        <input type="hidden" name="id" value="${employee.id}" >
                        <input type="submit" class="btn btn-success" name="act" value="Add" >
                    </div>

                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>