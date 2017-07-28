<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | ${companyName} | Add Asset</title>
    <g:javascript>
        var index = 0;
        window.onload=function(){
            document.getElementById("save").style.display='none';
            document.getElementById("remove").style.display='none';
            for(var i=0; i<60; i++){
                document.getElementById("div"+i).style.display = 'none';
            }
        }
        function add() {
            document.getElementById("save").style.display='block';
            document.getElementById("remove").style.display='block';
            document.getElementById("div"+index).style.display = 'block';
            document.getElementById("name"+index).disabled = false;
            document.getElementById("serialNo"+index).disabled = false;
            document.getElementById("productID"+index).disabled = false;
            document.getElementById("type"+index).disabled = false;
            if(++index > 60){
                index = 60
            }
            document.getElementById("index").value = index;
        }
        function remove() {
            if(--index <= 0 ){
                index = 0;
                document.getElementById("save").style.display='none';
                document.getElementById("remove").style.display='none';
            }
            document.getElementById("div"+index).style.display = 'none';
            document.getElementById("name"+index).disabled = true;
            document.getElementById("serialNo"+index).disabled = true;
            document.getElementById("productID"+index).disabled = true;
            document.getElementById("type"+index).disabled = true;
            document.getElementById("index").value = index;
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
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black;background-color: white; padding: 3px 6px 3px 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>

        </div>
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">${companyName} | Add Asset</h1></div>
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
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="assetForm" url="[controller:'asset', action:'saveAsset']">
                <fieldset>New Asset</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <g:each var="i" in="${ (0..<60) }">
                        <div class="col-md-12" id="div${i}">
                            <div class="col-md-3" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px">Name* </p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="name${i}" type="text" name="name${i}" >
                                </div>
                            </div>
                            <div class="col-md-3" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px">Serial No.* </p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="serialNo${i}" type="text" name="serialNo${i}" >
                                </div>
                            </div>
                            <div class="col-md-3" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px">Product ID* </p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="productID${i}" type="text" name="productID${i}" >
                                </div>
                            </div>
                            <div class="col-md-3" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px">Type* </p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="type${i}" type="text" name="type${i}" >
                                </div>
                            </div>
                        </div>
                    </g:each>
                    <button class="btn btn-danger" type="button" style="float:right; padding: 3px 8px 3px 8px" id="remove" onclick="remove()">Remove</button>
                    <button class="btn btn-success" type="button" style="margin-left:10px; font-size:30px; padding: 0 12px 0 12px; border-radius: 100px" onclick="add()">+</button><br>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input type="hidden" id="index" name="index" value="">
                <div class="col-sm-10"><input type="submit" class="btn btn-success" id="save" name="submit" value="Save"></div>
                <div class="col-sm-2" align="right" style="float: right"><h6 style="color: #595959; font-size: 11px">**Maximum 60</h6></div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>