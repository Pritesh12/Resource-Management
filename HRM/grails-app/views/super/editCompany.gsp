<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    %{--<asset:stylesheet src="configstyle.css"/>--}%
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | Edit Company</title>
    <g:javascript>
        req = true;
        var final=[];
        window.onload=function(){
            var length=${module.size()}
        var i=0;
        for (j= 0; j< length; j++) {

            <g:if test="${company.modules.size()>0}">
                <g:if test="${module.contains()}">
                </g:if>
                <g:each in="${company.modules.moduleName.sort()}" var="moduleName" status="k">
                    if(document.getElementById("checkSelect"+j).value == "${moduleName}"){
                         i=1;
                        }
                </g:each>
            </g:if>
            if(i == 0){
                document.getElementById("selectedRow"+j).style.display='none';
            }
            if(i == 1){
                document.getElementById("availableRow"+j).style.display='none';
            }
            i=0;
        }
    }
    function moduleSelect(){
        <g:if test="${module!=null}">
            <g:each in="${module}" var="mod" status="i">
                if(document.getElementById('checkAvailable${i}').checked){
            document.getElementById("selectedRow${i}").style.display='block';
            document.getElementById("availableRow${i}").style.display='none';
            document.getElementById("checkAvailable${i}").checked = false;
        }
            </g:each>
        </g:if>
        }
            function moduleRemove() {

        <g:if test="${module!=null}">
            <g:each var="i" in="${ (0..<module.size()) }">
                if(document.getElementById('checkSelect${i}').checked){

            document.getElementById("selectedRow${i}").style.display='none';
            document.getElementById("availableRow${i}").style.display='block';
            document.getElementById("checkSelect${i}").checked = false;
        }
            </g:each>
        </g:if>


        }
    function act(){
        var moduleStore=0;
        //Module Select--------------------------------------------------
        <g:if test="${module.size() > 0}">
            <g:each var="no" in="${ (0..<module.size()) }">

            if(document.getElementById("selectedRow${no}").style.display != 'none'){
                final[moduleStore]=document.getElementById('checkSelect${no}').value;
                moduleStore++;
            }
            </g:each>
        </g:if>

        //Field Check-----------------------------------------------------
        if(document.getElementById('taxId').value == "" || document.getElementById('registrationNo').value == "" || document.getElementById('email').value == "" || document.getElementById('phone').value == "" || document.getElementById('address').value == "" || document.getElementById('city').value == "" || document.getElementById('state').value == "" || document.getElementById('country').value == "" || document.getElementById('leaveRate').value == "" || document.getElementById('maxLeave').value == ""){
            req = false
            alert("Required fields are empty")
        }
        if(req){
            if (final.length < 1) {
                alert("Module not selected")
            }else{
                document.getElementById('formData').value=final;
                document.getElementById("updateForm").submit();
            }
        }else {
            req=true;
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

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">Edit ${company.companyName}</h1>
    </div>
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
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="updateForm" url="[controller:'super', action:'updateCompany']">

                <fieldset style="padding:0 10px 0 0">Company Information</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Tax Id*</p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="taxId" name="taxId" value="${company.taxId}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Company Status </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="companyStatus" name="companyStatus" value="${company.companyStatus}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Registration No.* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="registrationNo" name="registrationNo" value="${company.registrationNo}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Email* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="email" size="25" id="email" name="email" value="${company.email}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Phone* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="phone" name="phone" value="${company.phone}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Address* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="address" name="address" value="${company.address}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">City* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="city" name="city" value="${company.city}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">State* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="state" name="state" value="${company.state}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Country* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="country" name="country" value="${company.country}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Leave Rate* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="0" max="31" id="leaveRate" name="leaveRate" value="${company.leaveRate}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Maximum Leave* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="0" max="31" id="maxLeave" name="maxLeave" value="${company.maxLeave}">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${company.id}">
                </div>

                <div class="col-md-12" style="padding: 0 0 0 0" >
                    <hr style="margin: 10px 0 0 0;padding-bottom: 10px">
                </div>
                <fieldset style="padding:0 10px 0 0">Module</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 0 0 10px 0" align="center">

                    <div class="col-md-12">
                        <div class="col-md-5" style="padding: 0 0 0 0">
                            <div class="col-md-6"></div>
                            <div class="col-md-6" style="border-radius: 10px; background-color: #f2f2f2">
                                <h4>Available Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
                                <table border="0" style="width:100%;margin: 5px">
                                    <g:if test="${module!=null}">
                                        <g:each in="${module}" var="mod" status="i">
                                            <tr id="availableRow${i}">
                                                <td><input type="checkbox" name="check" id="checkAvailable${i}" value="${mod}"></td>
                                                <td><h5 style="margin: 0 0 0 0">${mod}</h5></td>
                                            </tr>
                                        </g:each>
                                    </g:if>

                                </table>
                            </div>
                        </div>
                        <div class="col-md-2" align="center" style="padding:5px">
                            <div class="col-md-12" style="padding:1px">
                                <a onclick="moduleSelect()">
                                    <span class="glyphicon glyphicon-circle-arrow-right"></span>
                                </a>
                            </div>
                            <div class="col-md-12" style="padding:1px">
                                <a onclick="moduleRemove()">
                                    <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-5" align="center" style="padding: 0 0 0 0">
                            <div class="col-md-6" style="border-radius: 10px; background-color: #f2f2f2">
                                <h4>Selected Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
                                <table border="0" style="width:100%;margin: 5px" id="tab">
                                    <g:if test="${module!=null}">
                                        <g:each in="${module}" var="mod" status="i">
                                            <tr id="selectedRow${i}">
                                                <td><input type="checkbox" name="check" id="checkSelect${i}" value="${mod}"></td>
                                                <td><h5 style="margin: 0 0 0 0">${mod}</h5></td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input type="hidden" name="data" id="formData">
                <button type="button" class="btn btn-success" name="save" onclick="act()">Save</button>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>