<%-- 
    Document   : company_jobs
    Created on : 22 Dec 2025, 10:11:40 am
    Author     : arash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="backend.DBConnection"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="checkCookie"></jsp:include>

<jsp:scriptlet>
    String email= (String) session.getAttribute("session_email");
    String c_email=request.getParameter("c_email");
</jsp:scriptlet>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home Page</title>


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
       >
            <!--search division job starts-->
       
            <!--search division job close-->
            <!--footer ke upar wala parts starts-->
        <div class="row">
    <!-- Left Column -->
    <div class="col-md-3">
       
    </div>

    <!-- Middle Column -->
    <div class="col-md-6" style="background-color: rgb(204, 255, 255); margin-top: 30px;">
        <%
            try {
                Connection con = DBConnection.getConnect();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs where company_email=?");
                ps.setString(1, c_email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String jobProfile = rs.getString("job_profle");
                    String Company = rs.getString("company");
                    String Experience = rs.getString("Experience");
                    String Salary = rs.getString("salary");
                    
        %>

        <!-- Each Job Card -->
        <div style="border: 2px solid red; background: #f8f9fa; padding: 10px; margin-top: 20px;">
            <table>
                <tr>
                    <td> <span class="glyphicon glyphicon-briefcase"></span> </td>
                    <td><span style="font-size: 14px; color: gray;">Job Profile:</span></td>
                    <td><%=jobProfile%></td>
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
                    <td>  </td>
                    <td></td>
                    <td ><a href="DescriptionJob.jsp?Jobid=<%=id%>">See full details</a> </td>
                </tr>
            </table>
        </div>

        <%
                } // end while
               
            } catch (Exception e) {

                e.printStackTrace();
            }
        %>
    </div>

    <!-- Right Column -->
    <div class="col-md-3">
       
    </div>
</div>

            <br>    <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>
                
            <jsp:include page="footer.jsp"></jsp:include>
  
              
    </body>
    </html>

