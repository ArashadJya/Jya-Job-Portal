<%-- 
    Document   : registers
    Created on : 2 Oct 2025, 10:21:32 pm
    Author     : arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css"/>

    <script>
        // regex patterns
        var name_pattern=/^[a-zA-Z ]{3,30}$/;
        var Email_pattern=/^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;
        var password_pattern=/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,20}$/;

        // realtime check functions
        function checkName(){
            var name2=document.regForm.name1.value.trim();
            if(name2===""){
                document.getElementById("nameErr").innerHTML="Name can not be empty";
            } else if(!name2.match(name_pattern)){
                document.getElementById("nameErr").innerHTML="Please enter a valid name";
            } else {
                document.getElementById("nameErr").innerHTML="";
            }
        }

        function checkEmail(){
            var email2=document.regForm.email1.value.trim();
            if(email2===""){
                document.getElementById("emailErr").innerHTML="Email can not be empty";
            } else if(!email2.match(Email_pattern)){
                document.getElementById("emailErr").innerHTML="Please enter a valid email";
            } else {
                document.getElementById("emailErr").innerHTML="";
            }
        }

        function checkPass(){
            var pass2=document.regForm.pass1.value.trim();
            if(pass2===""){
                document.getElementById("passErr").innerHTML="Password can not be empty";
            } else if(!pass2.match(password_pattern)){
                document.getElementById("passErr").innerHTML="Password must contain 8-20 chars, 1 uppercase, 1 lowercase, 1 digit, 1 special character";
            } else {
                document.getElementById("passErr").innerHTML="";
            }
        }

        function checkGender(){
            var gender2=document.regForm.gender.value;
            if(gender2===""){
                document.getElementById("genderErr").innerHTML="Please select gender";
            } else {
                document.getElementById("genderErr").innerHTML="";
            }
        }

        function checkField(){
            var checkboxes = document.getElementsByName("field1");
            var fieldSelected=false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    fieldSelected = true;
                    break;
                }
            }
            if(!fieldSelected){
                document.getElementById("fieldErr").innerHTML="Please select at least one Field";
            } else {
                document.getElementById("fieldErr").innerHTML="";
            }
        }

        function checkCity(){
            var city2=document.regForm.city1.value;
            if(city2==="Select City"){
                document.getElementById("cityErr").innerHTML="Please select a City";
            } else {
                document.getElementById("cityErr").innerHTML="";
            }
        }

        // Final validation on submit
        function validation(){
            checkName();
            checkEmail();
            checkPass();
            checkGender();
            checkField();
            checkCity();

            if(
                document.getElementById("nameErr").innerHTML==="" &&
                document.getElementById("emailErr").innerHTML==="" &&
                document.getElementById("passErr").innerHTML==="" &&
                document.getElementById("genderErr").innerHTML==="" &&
                document.getElementById("fieldErr").innerHTML==="" &&
                document.getElementById("cityErr").innerHTML===""
            ){
                document.regForm.action="reg";
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container-fluid">
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="text-align: center;background-color: aquamarine;">
                <form method="post" onsubmit="return validation()" name="regForm">
                     <h2>Register Here</h2> <br> 
                    
                    <input type="text" placeholder="Enter Name" class="reglog_tf_design" name="name1" onkeyup="checkName()" onblur="checkName()"/><br> 
                    <span id="nameErr" class="text-danger"></span><br>
                    
                    <input type="text" placeholder="Enter Email" class="reglog_tf_design" name="email1" onkeyup="checkEmail()" onblur="checkEmail()"/><br> 
                    <span id="emailErr" class="text-danger"></span><br>
                    
                    <input type="text" placeholder="Enter Password" class="reglog_tf_design" name="pass1" onkeyup="checkPass()" onblur="checkPass()"/><br> 
                    <span id="passErr" class="text-danger"></span><br>
                    
                    <b>Select Gender:</b> 
                    <input type="radio" name="gender" value="Male" onclick="checkGender()"/> Male 
                    <input type="radio" name="gender" value="Female" onclick="checkGender()"/> Female<br> 
                    <span id="genderErr" class="text-danger"></span><br>
                    
                    <b>Select Fields:</b> 
                    <input type="checkbox" name="field1" value="Information Techonology" onclick="checkField()"/> Information Techonology <br>
                    <input type="checkbox" name="field1" value="Marketing" onclick="checkField()"/> Marketing
                    <input type="checkbox" name="field1" value="Finance" onclick="checkField()"/> Finance <br>
                    <span id="fieldErr" class="text-danger"></span><br>
                    
                    <select name="city1" class="reglog_tf_design" onchange="checkCity()">
                        <option>Select City</option>
                        <option>Chandigarh</option>
                        <option>Panchukala</option>
                        <option>Mohali</option>
                    </select> <br>
                    <span id="cityErr" class="text-danger"></span><br>
                    
                    <input type="submit" value="Register" class="btn btn-primary"/><br><br>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        <br><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>

