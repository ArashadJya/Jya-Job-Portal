<%-- 
    Document   : about-us
    Created on : 22 Dec 2025, 10:47:48 am
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
       
            <!--search division job starts-->
       
            <!--search division job close-->
            <!--footer ke upar wala parts starts-->
        <div class="row">
    <!-- Left Column -->
    <div class="col-md-3">
        <ul>
            <li><a href="">Infosys</a></li>
            <li><a href="">Wipro</a></li>
            <li><a href="">IBM</a></li>
            <li><a href="">Google</a></li>
        </ul>
    </div>

    <!-- Middle Column -->
    <div class="col-md-6" style="border: 1px solid black; margin-top: 10px;">
        <p>This is a job Portal demo website Description</p>  <br> <br>
        
        <h2>Our Mission</h2>
    </div>

    <!-- Right Column -->
    <div class="col-md-3">
        <ul>
            <li><a href="">Infosys</a></li>
            <li><a href="">Wipro</a></li>
            <li><a href="">IBM</a></li>
            <li><a href="">Google</a></li>
        </ul>
    </div>
</div>

            <br>    <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>   <br>
                
            <jsp:include page="footer.jsp"></jsp:include>
  
              
    </body>
    </html>
