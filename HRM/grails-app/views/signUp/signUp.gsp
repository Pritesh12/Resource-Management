<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | Sign Up</title>
    <g:javascript>
    var userCheck=true;
    var compCheck=true;
    var final=[];
    var req = true;
    window.onload=function(){
        var length=${modules.size()}
        var i;
        for (j = 0; j < length; j++) {
        document.getElementById("row"+j).style.display='none';
        }
    }

    function moduleSelect(){

        <g:if test="${modules != null}">
            <g:each var="i" in="${ (0..<modules.size()) }">
                if(document.getElementById('checkAvailable${i}').checked){
                    document.getElementById("row${i}").style.display='block';
                    document.getElementById("rowAvailable${i}").style.display='none';
                    document.getElementById("checkAvailable${i}").checked = false;
                }
            </g:each>
        </g:if>
        }
        function moduleRemove() {
        <g:if test="${modules != null}">
            <g:each var="i" in="${(0..<modules.size())}">
                if(document.getElementById('checkSelect${i}').checked){

            document.getElementById("row${i}").style.display='none';
            document.getElementById("rowAvailable${i}").style.display='block';
            document.getElementById("checkSelect${i}").checked = false;
        }
            </g:each>
        </g:if>
        }
        function act(){
            var moduleStore=0;

        //Module Select--------------------
        <g:if test="${modules != null}">
            <g:each var="i" in="${(0..<modules.size())}">
                if(document.getElementById("row${i}").style.display != 'none'){
                    final[moduleStore]=document.getElementById('checkSelect${i}').value;
                    moduleStore++;
                }
            </g:each>
        </g:if>
        //Field Check---------------------
        if(document.getElementById('firstName').value == "" || document.getElementById('lastName').value == "" || document.getElementById('employeeEmail').value == "" || document.getElementById('username').value == "" || document.getElementById('password').value == "" || document.getElementById('companyName').value == "" || document.getElementById('taxId').value == "" || document.getElementById('registrationNo').value == "" || document.getElementById('companyEmail').value == "" || document.getElementById('companyPhone').value == "" || document.getElementById('address').value == "" || document.getElementById('city').value == "" || document.getElementById('state').value == "" || document.getElementById('country').value == "" || document.getElementById('leaveRate').value == "" || document.getElementById('maxLeave').value == ""){
            req = false
            alert("Required fields are empty")
        }

        //Username check-------------------
        <g:if test="${users != null}">
            <g:each in="${users}" var="user" status="i">
                if(document.getElementById('username').value == "${user}"){
                    userCheck=false;
                }
            </g:each>
        </g:if>

        //Company name check-------------------
        <g:if test="${companies != null}">
            <g:each in="${companies}" var="company" status="i">
                if(document.getElementById('companyName').value == "${company}"){
                    compCheck=false;
                }
            </g:each>
        </g:if>
        //Submission-------------------------
        if(req){
            if(userCheck){
                if(compCheck){
                    document.getElementById('formData').value=final;
                    document.getElementById("signUpForm").submit();
                }else {
                    compCheck = true;
                    alert("Company Name already exists")
                }
            }else {
                userCheck = true;
                alert("Username already exists")
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
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">Sign Up</h1>
    </div>

    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="signUpForm" url="[controller:'signUp', action:'saveSignup']">
                <fieldset>User Information</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px">First Name* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="firstName" name="firstName" value="Abhishek">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Middle Name</p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="middleName" name="middleName" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Last Name* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="lastName" name="lastName" value="Gharai">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Email* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="email" size="25" id="employeeEmail" name="employeeEmail" size="25" value="abhishek.gharai95@gmail.com">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Phone </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="employeePhone"  name="employeePhone" value="9148939424">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Age </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="18" max="50" id="age" name="age" value="22">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Location </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="location" name="location" value="Brookefield">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Username* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="username" name="username" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Password* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="password" size="25" id="password" name="password" value="1234">
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="padding: 0 0 0 0" >
                    <hr style="margin: 10px 0 0 0;padding-bottom: 10px">
                </div>
                <fieldset style="padding:0 10px 0 0">Company Information</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px">Company Name* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="companyName" name="companyName" value="" onchange="companyNameCheck()">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Tax Id*</p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="taxId" name="taxId" value="0123">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Company Status </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="companyStatus" name="companyStatus" value="active">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Registration No.* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="registrationNo" name="registrationNo" value="00123">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Email* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="email" size="25" id="companyEmail" name="companyEmail" value="excite@gmail.com">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Phone* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="companyPhone" name="companyPhone" value="9876543210">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Address* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="address" name="address" value="ITPL">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">City* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="city" name="city" value="Bangalore">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">State* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="state" name="state" value="Karnataka">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Country* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="country" name="country" value="India">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Leave Rate* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="0" max="30" id="leaveRate" name="leaveRate" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Maximum Leave* </p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="0" max="31" id="maxLeave" name="maxLeave" value="">
                        </div>
                    </div>
                </div>

                <div class="col-md-12" style="padding: 0 0 0 0" >
                    <hr style="margin: 10px 0 0 0;padding-bottom: 10px">
                </div>
                <fieldset style="padding:0 10px 0 0">Select Module</fieldset><hr>
                <div class="col-md-12" style="padding: 0 0 10px 0" align="center">

                    <div class="col-md-12">
                        <div class="col-md-5" style="padding: 0 0 0 0">
                            <div class="col-md-6"></div>
                            <div class="col-md-6" style="border-radius: 10px; background-color: #f2f2f2">
                                <h4>Available Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
                                <table border="0" style="width:100%;margin: 5px">
                                    <g:if test="${modules!=null}">
                                        <g:each in="${modules}" var="module" status="i">
                                            <tr id="rowAvailable${i}">
                                                <td><input type="checkbox" name="check" id="checkAvailable${i}" value="${module}"></td>
                                                <td><h5 style="margin: 0 0 0 0">${module}</h5></td>
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
                                    <g:if test="${modules!=null}">
                                        <g:each in="${modules}" var="module" status="i">
                                            <tr id="row${i}">
                                                <td><input type="checkbox" name="check" id="checkSelect${i}" value="${module}"></td>
                                                <td><h5 style="margin: 0 0 0 0">${module}</h5></td>
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
                <button type="button" class="btn btn-success" name="create" onclick="act()">Create</button>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
