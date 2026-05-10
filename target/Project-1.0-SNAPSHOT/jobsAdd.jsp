<%-- 
    Document   : jobsAdd
    Created on : 25 Oct 2025, 9:49:09 am
    Author     : arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
     <!--jQuery--> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <!--Bootstrap JS--> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
     <!--Custom CSS--> 
    <link rel="stylesheet" href="css/style.css"/>

    </head>
    <body>
        <jsp:include page="profileHeader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6" style="border: 1px solid gray; box-shadow: 1px 1px 1px gray">
                <form action="jobsadd" method="post">
                     <table>
                    <tr>
                        <td> Job Profile</td>
                        <td><input type="text" placeholder="Enter Job Profile" name="jobProfile1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td>Company </td>
                        <td><input type="text" placeholder="Enter Company" name="company1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td>Salary</td>
                        <td><input type="text" placeholder="Enter Salary" name="salary1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Experience</td>
                        <td><input type="text" placeholder="Enter experience" name="experience1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td>No Of Openings</td>
                        <td><input type="text" placeholder="Enter No of Openings" name="openings1" class="textfielddesign"/> <br><br> </td>
                    </tr>
                    <tr>
                        <td>  Time Venue</td>
                        <td><input type="text" placeholder="Enter Time Venue" name="timevenue1" class="textfielddesign"/> <br><br> </td>
                    </tr>
                    <tr>
                        <td> Description</td>
                        <td><input type="text" placeholder="Enter Description" name="description1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Company Email</td>
                        <td><input type="text" placeholder="Enter Company email" name="cemail1" class="textfielddesign"/> <br><br> </td>
                    </tr>
                    <tr>
                        <td>Company Person Name</td>
                        <td><input type="text" placeholder="Enter Company Person Name" name="cpName1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Company Phone No</td>
                        <td><input type="text" placeholder="Enter Company Phone no" name="cPhone1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Date</td>
                        <td><input type="text" placeholder="Enter date" name="date1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td>  Time</td>
                        <td><input type="text" placeholder="Enter Time" name="time1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Company Person Profile</td>
                        <td><input type="text" placeholder="Enter Person Profile" name="cpProfile1" class="textfielddesign"/> <br><br></td>
                    </tr>
                    <tr>
                        <td> Location </td>
                        <td> <input type="text" placeholder="Enter Location" name="Location1" class="textfielddesign"/> </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit"  value="Submit" class="btn btn-success"/> <br><br></td>
                    </tr>
                </table>
                
                </form>
            </div>
            <div class="col-md-3"></div>
            
        </div>
        <br>
        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
