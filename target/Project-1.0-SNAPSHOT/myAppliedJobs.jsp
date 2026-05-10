<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="backend.DBConnection"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String email= (String) session.getAttribute("session_email");
    
</jsp:scriptlet>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>


        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        
        <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">


        
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        
       <%
            if(email==null ? email==null :email.trim().equals("null"))
            {
        %>
            <jsp:include page="header.jsp"></jsp:include>
        
        <%
         }
         else
            {
          %>
            <jsp:include page="profileHeader.jsp"></jsp:include>
            <%
                }
           %>

                
            <jsp:include page="menubar.jsp"></jsp:include>
        
            <!--footer ke upar wala parts starts-->
        <div class="row">
            <div class="col-md-3"></div>

    <!-- Middle Column -->
    <div class="col-md-6" style="background-color: rgb(204, 255, 255); margin-top: 30px;">
        <%
            try {
                Connection con = DBConnection.getConnect();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM applyjobs where email=?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int Id = rs.getInt("Jobid");
                   PreparedStatement ps1=con.prepareStatement("select * from jobs where id=?");
                   ps1.setInt(1, Id);
                   ResultSet rs1=ps1.executeQuery();
                   while(rs1.next()){
                   String Job_Profile=rs1.getString("job_profle");
                   String Company=rs1.getString("company");
                   String Experience=rs1.getString("Experience");
                   String Salary=rs1.getString("salary");
                   
            
                    
        %>

        <!-- Each Job Card -->
        <div style="border: 2px solid red; background: #f8f9fa; padding: 10px; margin-top: 20px;">
            <table>
                <tr>
                    <td> <span class="glyphicon glyphicon-briefcase"></span> </td>
                    <td><span style="font-size: 14px; color: gray;">Job Profile:</span></td>
                    <td><%=Job_Profile%></td>
                </tr>
                <tr>
                    <td><span class="bi bi-building"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Company:</span></td>
                    <td><%=Company%></td>
                </tr>
                <tr>
                    <td>  <span class="bi bi-briefcase"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Experience:</span></td>
                    <td><%=Experience%></td>
                </tr>
                <tr>
                    <td> <span class="bi bi-currency-dollar"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Salary:</span></td>
                    <td><%=Salary%></td>
                </tr>
                <tr>
                    <td> <%=Id%> </td>
                    <td></td>
                    <td ><a href="DescriptionJob.jsp?Jobid=<%=Id%>">See full details</a> </td>
                </tr>
            </table>
        </div>

        <%
            }
                } // end while
               
            } catch (Exception e) {

                e.printStackTrace();
            }
        %>
    </div>
    <div class="col-md-3"></div>

    <!-- Right Column -->
    
</div>

            <br>    <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>
                
            <jsp:include page="footer.jsp"></jsp:include>
  
              
    </body>
    </html>
