<%-- 
    Document   : profile
    Created on : 2 Oct 2025, 8:04:16 am
    Author     : arash
--%>

<%@page import="backend.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
             String name=(String) session.getAttribute("session_name");
             String gendedr=(String) session.getAttribute("session_gender");
             String email=(String) session.getAttribute("session_email");
             String city=(String) session.getAttribute("session_city");
             String field=(String) session.getAttribute("session_field");
              String image= (String) session.getAttribute("session_img_profile");
             
             
             
             if(field==null ||field.equals("")){
             field="--Not Available---";
            }
             String title=(String) session.getAttribute("session_title");
             String skills=(String) session.getAttribute("session_skills");
                if(name==null||name.equals("")) 
                {
                response.sendRedirect("Login.jsp");
                //yaha ham response use kiye hai kyuki jsp me bydefault response object hota hai
                
                }
             
        
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>  Welcome <jsp:expression> name</jsp:expression> </title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="profileHeader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <%
            %>
            <br> <br>
      <!--Edit profile about jsp part start-->      
          <div class="row">
                
              <div class="col-md-2"></div>                
              <div class="col-md-8">
                  <div class="row"style="border: 1px solid gray;box-shadow: 1px 1px 1px gray" >
                      <div class="col-md-2">
                          <img src="profilepics/<jsp:expression>image</jsp:expression> "   width="100px" height="100px" style="border-radius: 50%;" " alt="alt"/>
                          <a href="edit-profile-img.jsp" ><span class="glyphicon glyphicon-pencil" style="font-size: 20px; float: right; "></span></a>
                          
                      </div>
                      <div class="col-md-10">
                          <h3><jsp:expression>name </jsp:expression> </h3>
                          <jsp:expression>title</jsp:expression> <br> <br>
                          <jsp:expression>skills</jsp:expression> <br> <br>
                          <jsp:expression>gendedr</jsp:expression> <br>
                          <jsp:expression>city</jsp:expression>  <br>
                          <jsp:expression>field</jsp:expression>
                          <a href="edit-profile-about.jsp"  style=" float:right;   font-size: 20px;" ><span class="glyphicon glyphicon-pencil"></span></a>
                      </div>
                      
                  </div>
              </div>                
              <div class="col-md-2"></div>                
          </div> 
                          <br> <br>
                           
        <div class="row" >
            <div class="col-md-2"></div>
            <div class="col-md-8">
    
            <h4 >
            Educational Details  
            <span style="font-size: 12px;">
                <a href="add-profile-education.jsp">
                    <span class="glyphicon glyphicon-plus"></span>
                </a>
            </span>
        </h4>
                </div>
            <div class="col-md-2"></div>
                </div>

        <div class="row"   >
            <div class="col-md-2"></div>
            <div class=col-md-8 style="border: 1px solid gray;box-shadow: 1px 1px 1px gray">
    <%          
        
        try {
            Connection con = DBConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM education WHERE email='" + email + "'");
            
            while(rs.next()) {
                String school = rs.getString("school");
                String degree = rs.getString("Degree");
                String year = rs.getString("Year");
                String grade = rs.getString("Grade");
                String description = rs.getString("Description");
                String id=rs.getString("id");
                session.setAttribute("Session_school", school);
        %>
                    <div class=row >
                    <div class="col-md-2"></div>
                        
                    <div class="col-md-8" style="border: 1px solid gray;box-shadow: 1px 1px 1px gray;margin-top: 10px;background-color: graytext">
                    <form method="Post">
                        <a href="edit-profile-education.jsp?edu=<jsp:expression>id</jsp:expression>"  style=" float:right;    font-size: 20px;" ><span class="glyphicon glyphicon-pencil"></span></a>
                        <a href="deleteEducationDetails?edu= <jsp:expression>id</jsp:expression> "style=" float:right;   font-size: 20px; margin-top:30px;" >&#128465</a>
        <!--yha par maine link ke sath hi jo maine table se id get karwaya hsi usko bhi sath kar diya iske sath ye link jis page par jayega usi ke sath bhi id bhi jayega jo is time edu me store hai-->                
                        <b>School:</b> <%= school %> <br>
                        <b>Degree:</b> <%= degree %> 
                         <%= year %> <br>
                        <b>Grade:</b> <%= grade %> <br>
                        <b>Description:</b> <%= description %> <br>
                    </form>
                    </div>
                    <div class="col-md-2"></div>
                    

                </div>
                    <br>
        <%
            } // end while
//            rs.close();
//            st.close();
//            con.close();
        } catch(Exception e) {
            out.print(e);
        }
        %>
        
         </div>
       </div>
        <br> <br>
         
         <!--Exprerience adding coding start-->
      <div class="row" >
        <div class="col-md-2"></div>
        <div class="col-md-8">
    
            <h4 >
            Experience Details  
            <span style="font-size: 12px;">
                <a href="addProfileExperience.jsp">
                    <span class="glyphicon glyphicon-plus"></span>
                </a>
            </span>
           </h4>
        </div>
        <div class="col-md-2"></div>
      </div>
      <div class="row">
          <div class="col-md-2"></div> 
          <div class="col-md-8" style="border: 1px solid gray ;box-shadow: 1px 1px 1px gray ">
              <%
                  try{
                 Connection con=DBConnection.getConnect();
                 Statement st=con.createStatement();
                 ResultSet rs= st.executeQuery("select*from experience where email='"+email+"'");
                 while(rs.next()){
                     String company=rs.getString("company");
                     String Location=rs.getString("Location");
                     String Year=rs.getString("Years");
                     String JobTitle=rs.getString("JobTitle");
                     String Description=rs.getString("Description");
                     String id=rs.getString("id");
                  %>
                  <div class="row">
                      <div class="col-md-2"></div>
                      <div class="col-md-8" style="border: 1px solid gray;box-shadow: 1px 1px 1px gray;margin-top: 10px; background-color: graytext">
                          <a href="editProfileExperience.jsp?edu=<jsp:expression>id</jsp:expression>" style="float: right;font-size: 20px;"> <span class="glyphicon glyphicon-pencil"></span> </a>
                          <a href="deleteExperienceDetails?edu= <jsp:expression>id</jsp:expression> "style=" float:right;   font-size: 20px; margin-top:30px;" >&#128465</a>
                          <b>Company:</b><jsp:expression>company</jsp:expression>  <br> 
                          <b> Location:</b> <jsp:expression>Location</jsp:expression>   <br>
                          <b> Year:</b><jsp:expression>Year</jsp:expression>  <br> 
                          <b> JobTitle:</b><jsp:expression>JobTitle</jsp:expression>   <br>
                          <b> Description:</b><jsp:expression>Description</jsp:expression>   <br>
                      </div>
                      <div class="col-md-2"></div>   
                  </div>
                      <br>
                <%       
                  }
//                   rs.close();
//                    st.close();
//                    db.close();
                   }
                  catch(Exception e)
                    {
                      out.print(e);
                    }
                 %>
                 
              
          </div>
                 <div class="col-md-2"></div>   
                 <br> <br>

      </div> 
                 <br> <br>
         <!--Resume part starts-->
         <div class="row">
             <div class="col-md-2"></div>
             <div class="col-md-8" style="border: 1px solid gray; box-shadow: 1px 1px 1px gray;">
                 <div class="row">
                     <div class="col-md-12">
                         <h4>
                             Resume Details
                             
                         </h4>
                     </div>
                 </div>   
                     <br>
                     <div class="row">
                         <div class="col-md-12" style="border: 1px solid gray; box-shadow: 1px 1px 1px gray; background-color: gray;font-size: 25px">
                            
                                &nbsp;  &nbsp;  &nbsp;  &nbsp; <a href="uploadResume.jsp">
                                     <span class="glyphicon glyphicon-plus"></span>
                                 </a>
                              upload Resume
                              <jsp:scriptlet>
                                  String file_name=null;
                                  try{
                                  
                                  Connection con=DBConnection.getConnect();
                                  PreparedStatement ps=con.prepareStatement("select*from resume where email=?");
                                  ps.setString(1, email);
                                  ResultSet rs=ps.executeQuery();
                                  if(rs.next()){
                                  file_name=rs.getString("path");
                                  session.setAttribute("session_filename",  file_name);
                                  
                              </jsp:scriptlet>
                              <a href="downloadresume"> <input type="submit" value="DownloadResume" class="btn btn-success"/> </a>
                             <jsp:scriptlet>
                                 
                                  }
                              }
                            catch(Exception e){
                                   }
                             </jsp:scriptlet>
                                  
                                  
                         </div>
                     </div>
                 <br> 
                     <div class="row">
                         <div class="col-md-12" style="border: 1px solid gray; box-shadow: 1px 1px 1px gray; background-color: gray; font-size: 25px">
                            
                             &nbsp;  &nbsp;  &nbsp;  &nbsp;  <a href="ResumeBuilderDetails.jsp">
                                     <span class="glyphicon glyphicon-pencil"></span>
                                 </a>
                              Resume Builder
                         </div>
                     </div>
                 <br>
                    
                    
                 </div>
             </div>
             
             <div class="col-md-2"></div>
         </div>     
         

          <!--</div>-->                
          <div class="row" >
              <div class="col-md-4"></div>                     
              <div class="col-md-6" style="" > <a <input type="submit" name="Folloe" class="btn btn-primary">Follow</a> </div>                     
              <div class="col-md-2"></div>                     
          </div>                 
                           
                          <br> <br>
        <jsp:include page="footer.jsp"/>
        
    </body>
</html>
    
    

