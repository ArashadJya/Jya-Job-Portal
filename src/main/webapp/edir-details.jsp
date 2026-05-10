<%-- 
    Document   : edir-details
    Created on : 3 Oct 2025, 4:11:36 pm
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
             String gendedr=(String) session.getAttribute("session_gender");
             String email=(String) session.getAttribute("session_email");
             String city=(String) session.getAttribute("session_city");
             String field=(String) session.getAttribute("session_field");
                if(name==null||name.equals("")) 
                {
                response.sendRedirect("Login.jsp");
                //yaha ham response use kiye hai kyuki jsp me bydefault response object hota hai
                
                }
             
            %>
            <br> <br>
          <div class="row">
                
              <div class="col-md-2"></div>                
              <div class="col-md-8">
                  <div class="row">
                      <div class="col-md-2">
                          <img src="Jya-Job-Portal-1759143023657/Jya Job Portal-logo.png"   width="100px" height="100px" style="border-radius: 50%" alt="alt"/>
                          
                      </div>
                      <div class="col-md-10">
                          <h3> <jsp:expression>name </jsp:expression> </h3>
                          <table>
                              <tr>
                                  <td>  <span style="color: red;font-size: ">  Email:</span> </td>
                                  <td><input type="text" value="<jsp:expression>email </jsp:expression>" class="textfielddesign"/><br> <br> </td>
                              </tr>
                              <tr>
                                  <td>  <span style="color: red;font-size: ">  Gender:</span> </td>
                                  <td><input type="text" value="<jsp:expression>gendedr </jsp:expression>" class="textfielddesign"/><br> <br> </td>
                              </tr>
                              <tr>
                                  <td>  <span style="color: red;font-size: ">  City:</span> </td>
                                  <td><input type="text" value="<jsp:expression>city </jsp:expression>" class="textfielddesign"/><br> <br> </td>
                              </tr>
                              <tr>
                                  <td>  <span style="color: red;font-size: ">  Field:</span> </td>
                                  <td><input type="text" value="<jsp:expression>field </jsp:expression>" class="textfielddesign"/><br> <br> </td>
                              </tr>
                              <tr>
                                  <td></td>
                                  <td> <input type="submit" value="Update" class="btn btn-danger"/> </td>
                              </tr>
                          </table>
                          
                      </div>
                      
                  </div>
              </div>                
              <div class="col-md-2"></div>                
          </div>  <br>  
                              
                           
          <div class="row">
              <div class="col-md-3"> </div>             
              <div class="col-md-9">
                  <h5>Educational Details</h5>
                  <table>
                      <tr>
                          <td>  <span style="color: red">School</span> </td>
                          <td><input type="text" value="" class="textfielddesign"/>    <br> <br> </td>
                      </tr>
                      <tr>
                          <td> <span style="color: red">College</span> </td>
                          <td><input type="text" value="" class="textfielddesign"/>   <br> <br></td>
                      </tr>
                      <tr>
                          <td> <span style="color: red">Year</span> </td>
                          <td><input type="text" value="" class="textfielddesign"/>   <br> <br></td>
                      </tr>
                      <tr>
                          <td> <span style="color: red">Passing Year</span> </td>
                          <td><input type="text" value="" class="textfielddesign"/>   <br> <br></td>
                      </tr>
                      <tr>
                          <td> <span style="color: red">Passing Marks</span> </td>
                          <td><input type="text" value="" class="textfielddesign"/>   <br> <br></td>
                      </tr>
                       <tr>
                                  <td></td>
                                  <td> <input type="submit" value="Update" class="btn btn-danger"/> </td>
                              </tr>
                  </table>
                 
              </div>
          </div>                
          <div class="row">
              <div class="col-md-4"></div>                     
              <div class="col-md-6" style="" >  </div>                     
              <div class="col-md-2"></div>                     
          </div>                 
                           
                          <br> <br>
        <jsp:include page="footer.jsp"/>
        
    </body>
    
    


