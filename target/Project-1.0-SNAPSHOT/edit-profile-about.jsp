<%-- 
    Document   : edit-profile-about.jsp
    Created on : 4 Oct 2025, 8:49:21 am
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
        <script>
            function ChangeCity(){
                document.getElementById('chngcitytf').value=document.getElementById('chngcity').value;
            }
        </script>
        <% 
             String name=(String) session.getAttribute("session_name");
             String gendedr=(String) session.getAttribute("session_gender");
             String email=(String) session.getAttribute("session_email");
             String city=(String) session.getAttribute("session_city");
             String field=(String) session.getAttribute("session_field");
             String Title=(String) session.getAttribute("session_title");
             
               String image= (String) session.getAttribute("session_img_profile");
               if(Title==null ||Title.equals("")){
               Title="";
            }
            String skills=(String) session.getAttribute("session_skills");
            if(skills==null || skills.equals("")){
              skills="";
              
            }
            if( name==null ||name.equals("")){
          response.sendRedirect("Login.jsp");
          
            }
             
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
                              <b>  </b> <br>
                              <form action="EditProfileAbout" method="post">
                              <table>
                                  <tr>
                                      <td></td>
                                      <td><input type="text" value="<jsp:expression> email</jsp:expression>" class="textfielddesign"  disabled=""/> <br><br></td>
                                  </tr>
                                  <tr>
                                      <td>Name:</td>
                                      <td><input type="text" value=" <jsp:expression> name </jsp:expression> " name="name1" placeholder="Enter a Name" class="textfielddesign"/> <br> <br></td>
                                  </tr>
                                  <tr>
                                      <td>Gender:</td>
                                      <td><input type="text" value=" <jsp:expression> gendedr </jsp:expression> " name="gender1" placeholder="Enter a Gender" class="textfielddesign"/> <br> <br></td>
                                  </tr>
                                  <tr>
                                      <td>City:</td>
                                      <td><input id="chngcitytf" readonly="" type="text" value=" <jsp:expression> city </jsp:expression> " name="city1" placeholder="Enter a City" class="textfielddesign"/> 
                                      <select id="chngcity" onchange="ChangeCity()">
                                          
                                          <option disabled="">Select City</option>
                                          <option value="">-- Select State --</option>
                                          <option value="Andhra Pradesh">Andhra Pradesh</option>
                                          <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                          <option value="Assam">Assam</option>
                                          <option value="Bihar">Bihar</option>
                                          <option value="Chhattisgarh">Chhattisgarh</option>
                                          <option value="Goa">Goa</option>
                                          <option value="Gujarat">Gujarat</option>
                                          <option value="Haryana">Haryana</option>
                                          <option value="Himachal Pradesh">Himachal Pradesh</option>
                                          <option value="Jharkhand">Jharkhand</option>
                                          <option value="Karnataka">Karnataka</option>
                                          <option value="Kerala">Kerala</option>
                                          <option value="Madhya Pradesh">Madhya Pradesh</option>
                                          <option value="Maharashtra">Maharashtra</option>
                                          <option value="Manipur">Manipur</option>
                                          <option value="Meghalaya">Meghalaya</option>
                                          <option value="Mizoram">Mizoram</option>
                                          <option value="Nagaland">Nagaland</option>
                                          <option value="Odisha">Odisha</option>
                                          <option value="Punjab">Punjab</option>
                                          <option value="Rajasthan">Rajasthan</option>
                                          <option value="Sikkim">Sikkim</option>
                                          <option value="Tamil Nadu">Tamil Nadu</option>
                                          <option value="Telangana">Telangana</option>
                                          <option value="Tripura">Tripura</option>
                                          <option value="Uttar Pradesh">Uttar Pradesh</option>
                                          <option value="Uttarakhand">Uttarakhand</option>
                                          <option value="West Bengal">West Bengal</option>

                                          
                                      </select> <br> <br>
                                  </td>
                                  
                                  </tr>
                                  <tr>
                                      <td>Tittle</td>
                                      <td><input type="text" placeholder="Profile Tittle"  name="title1"   class="textfielddesign"  value=" <jsp:expression> Title </jsp:expression> " /> <br> <br></td>
                                  </tr> 
                              </table>
                                  <textarea placeholder="Skills" name="skills1" " style="margin-left: 55px; width: 300px; height: 100px;padding: 5px 10px; border-radius: 5px "> <jsp:expression> skills </jsp:expression></textarea> <br> 
                                      <br>
                                  <input type="submit" value="Update" class="btn btn-danger" style="margin-left: 50px"/>
                                  <br><br>
                          </form> 
                      </div>
                      
                  </div>
              </div>                
              <div class="col-md-2"></div>                
          </div>  
                           
                    
                         
                           
                          <br> <br>
        <jsp:include page="footer.jsp"/>
        
    </body>
    
    

