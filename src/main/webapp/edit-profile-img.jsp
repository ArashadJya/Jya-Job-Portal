<%-- 
    Document   : edit-profile-img
    Created on : 19 Oct 2025, 9:58:00 am
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
           
            if( name==null ||name.equals("")){
          response.sendRedirect("Login.jsp");
          
            }
             
            %>
            <br> <br>
          <div class="row">
                
              <div class="col-md-2"></div>                
              <div class="col-md-8">
                  <div class="row"style="border: 1px solid gray;box-shadow: 1px 1px 1px gray" >
                      <div class="col-md-3">
                          <img src="profilepics/<jsp:expression>image</jsp:expression>"   height="150px" width="150px" style="border-radius: 50%"" alt="alt"/>
                          
                      </div>
                      <div class="col-md-9">
                          <h1> Edit Profile Pic</h1>
                              <form action="updateProfilePic" method="post" enctype="multipart/form-data">
                          <b> <jsp:expression>name</jsp:expression> </b>
                          ( <jsp:expression> email </jsp:expression> )
                          <br> <br>
                                      <input type="file" name="uploadProfilePic"/> 
                                      <br> <br>
                                  <input type="submit" value="Update profile pic" class="btn btn-danger" />
                                  <br> <br>
                          </form> 
                      </div>
                      
                  </div>
              </div>                
              <div class="col-md-2"></div>                
          </div>  
                           
                    
                         
                           
                          <br> <br>
        <jsp:include page="footer.jsp"/>
        
    </body>
    
    

