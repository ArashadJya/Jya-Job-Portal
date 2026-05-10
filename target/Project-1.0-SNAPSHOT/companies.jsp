<%-- 
    Document   : companies
    Created on : 25 Nov 2025, 11:02:33 am
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
       
            <!--search division job starts-->
       
            <!--search division job close-->
            <!--footer ke upar wala parts starts-->
        <div class="row">
    <!-- Left Column -->
    <div class="col-md-3">
       
    </div>
   
    <!-- Middle Column -->
    <div class="col-md-6" style="background-color: rgb(204, 255, 255); margin-top: 30px;">
         <h1>Our companies Partners</h1>
        <%
            try {
                Connection con = DBConnection.getConnect();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM company_reg");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String c_name = rs.getString("c_name");
                    String c_email = rs.getString("c_email");
                    String c_password = rs.getString("c_password");
                    String c_phoneno = rs.getString("c_phoneno");
                    
        %>
  
        <!-- Each Job Card -->
        <div style="border: 2px solid red; background: #f8f9fa; padding: 10px; margin-top: 20px;">
            <table>
                <tr>
                    <td> <span class="glyphicon glyphicon-briefcase"></span> </td>
                    <td><span style="font-size: 14px; color: gray;">Company_Name:</span></td>
                    <td><%=c_name%></td>
                </tr>
                <tr>
                    <td><span class="bi bi-building"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Company_Email:</span></td>
                    <td><%=c_email%></td>
                </tr>
                <tr>
                    <td>  <span class="bi bi-briefcase"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Password:</span></td>
                    <td><%=c_password%></td>
                </tr>
                <tr>
                    <td> <span class="bi bi-building"></span></td>
                    <td><span style="font-size: 14px; color: gray;">Company PhoneNo:</span></td>
                    <td><%=c_phoneno%></td>
                </tr>
                <tr>
                    <td>  </td>
                    <td></td>
                    <td ><a href="company_jobs.jsp?c_email=<%=c_email%>">see All Jobs Of this company</a> </td>
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
