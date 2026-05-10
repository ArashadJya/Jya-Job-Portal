<%-- 
    Document   : editProfileExperience
    Created on : 15 Oct 2025, 12:28:19 pm
    Author     : arash
--%>

<%@page import="backend.DBConnection"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
      String image= (String) session.getAttribute("session_img_profile");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>JSP Page</title>
        
             <!--jQuery--> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <!--Bootstrap JS--> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
     <!--Custom CSS--> 
    <link rel="stylesheet" href="css/style.css"/>
    <%
        try{
        String email= (String) session.getAttribute("session_email");
        String id=request.getParameter("edu");
        Connection con=DBConnection.getConnect();
        Statement st=con.createStatement();
      ResultSet rs=  st.executeQuery("select*from experience where id='"+id+"'");
      while(rs.next()){
             String Company=rs.getString("company");
             String Location=rs.getString("Location");
             String Year=rs.getString("Years");
             String JobTitle=rs.getString("JobTitle");
             String Description=rs.getString("Description");
        
        
    %>
    </head>
    <body>
         <jsp:include page="profileHeader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <br>
        <form action="editExperienceDetails?edu=<jsp:expression>id</jsp:expression>" method="post">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="row" style="border: 1px solid gray; box-shadow: 1px 1px 1px gray;">
                        <div class="col-md-2">
                           <img src="image/<jsp:expression>image</jsp:expression>" alt="alt" width="100px" height="100px" style="border-radius: 50%"/> 
 
                        </div>
                        
                        <div class="col-md-8" >
                    <table>
                        <tr>
                            <td></td>
                            <td> <input type="text"  disabled="" value=" <jsp:expression>email</jsp:expression> "/><br> <br> </td> 
                        </tr>
                        
                        <tr>
                            <td> Company</td>
                            <td> <input type="text" class="textfielddesign" name="company1"  value=" <jsp:expression>Company</jsp:expression> "/><br> <br> </td>
                        </tr>
                        <tr>
                            <td> Location</td>
                            <td> <input type="text" class="textfielddesign" name="Location1"  value=" <jsp:expression>Location</jsp:expression> "/><br> <br> </td>
                        </tr>
                        <tr>
                            <td>Years</td>
                            <td> <input type="text" class="textfielddesign"  name="Year1" value=" <jsp:expression>Year</jsp:expression> "/><br> <br> </td> 
                        </tr>
                        <tr>
                            <td>JobTitle</td>
                            <td> <input type="text" class="textfielddesign" name="JobTitle1" value=" <jsp:expression>JobTitle</jsp:expression> "/><br> <br> </td> 
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>  <textarea   name="Description1" style=" width: 300px; height: 100px;padding: 5px 10px; border-radius: 5px "><jsp:expression>Description</jsp:expression>  </textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Update Experience" class="btn btn-danger"/> </td>
                        </tr>
                    </table>
                </div>
                        <div class="col-md-2"></div>
                        
                    </div>
                    
                </div>
                <div class="col-md-2"></div>
            </div>
            
        </form>
                        <br>
        <%
            }
           
            }
             catch(Exception e)
                   {
                      out.print(e);
                   }
            %>
        
        
         <jsp:include page="footer.jsp"/>
       
    </body>
</html>
