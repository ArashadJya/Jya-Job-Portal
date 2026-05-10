<%-- 
    Document   : edit-profile-education
    Created on : 5 Oct 2025, 8:29:49 am
    Author     : arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css"/>

    </head>
    <body>
        <jsp:include page="profileHeader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <% 
             String name=(String) session.getAttribute("session_name");
             String email=(String) session.getAttribute("session_email");  
             
 String image= (String) session.getAttribute("session_img_profile");
            %>
            <br> <br>
          <div class="row">
                
              <div class="col-md-2"></div>                
              <div class="col-md-8">
                  <div class="row"style="border: 1px solid gray;box-shadow: 1px 1px 1px gray" >
                      <div class="col-md-2">
                          <img src="profilepics/<jsp:expression>image</jsp:expression>"   width="100px" height="100px" style="border-radius: 50%" alt="alt"/>
                          
                      </div>
                      <div class="col-md-10">
                              <form action="AddEducationDetails" method="post">
                                  <h1>Add Education Details</h1>  
                              <table>
                                  <tr>
                                      <td></td>
                                      <td> <input type="text" value=" <jsp:expression> email</jsp:expression> " class="textfielddesign" disabled="" /><br> <br></td>
                                  </tr>
                                  <tr>
                                      <td >School: </td> 
                                      <td><input type="text"  name="School1" class="textfielddesign"/> <br> <br></td>
                                  </tr>
                                  <tr>
                                      <td>Degree:</td>
                                      <td><input type="text"  name="Degree1" placeholder="Eg. !0th or B.Tech" class="textfielddesign"/> <br> <br></td>
                                  </tr>
                                  <tr>
                                      <td>Year:</td>
                                      <td><input type="text"  name="Year1" placeholder="Eg. 2001-2004" class="textfielddesign"/> <br> <br></td>
                                  </tr>
                                  <tr>
                                      <td>Grade</td>
                                      <td><input type="text"   name="Grade1" placeholder="90"  class="textfielddesign"  />% <br> <br></td>
                                  </tr> 
                                  <tr>
                                      <td>Description </td>
                                      <td><textarea placeholder="Skills" name="Description1"  " style=" width: 300px; height: 100px;padding: 5px 10px; border-radius: 5px "> </textarea> <br> </td>
                                  </tr>
                              </table>
                                  <input type="submit" value="Add Education" class="btn btn-danger" style="margin-left: 50px"/>
                          </form> 
                      </div>
                      
                  </div>
              </div>                
              <div class="col-md-2"></div>                
          </div>  
                           
                    
                         
                           
                          <br> <br>
        <jsp:include page="footer.jsp"/>
        
    </body>
    
    

