<%-- 
    Document   : contact-us-nouser
    Created on : 22 Dec 2025, 11:46:31 am
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
        
       

                
      
            <!--search division job starts-->
       
            <!--search division job close-->
            <!--footer ke upar wala parts starts-->
        <div class="row">
    <!-- Left Column -->
    <div class="col-md-3">
       
    </div>

    <!-- Middle Column -->
       

        <!-- Each Job Card -->
       
          <div class="col-md-6" style="text-align: center;background-color: aquamarine;">
                    <form method="post" action="contactUs">
                         <h2>contact Us</h2> <br> 
                         <input type="text" placeholder="Enter Name" class="reglog_tf_design" name="name1" /><br> <br>
                    <input type="text" placeholder="Enter Email" class="reglog_tf_design" name="email1" /><br> <br>
                    <input type="text" placeholder="Enter Subject" class="reglog_tf_design" name="subject1" /><br> <br>
                    <textarea placeholder="Enter Message" name="message1" style="width: 300px; height: 200px"> </textarea> <br> <br>
                    <input type="submit" value="Send" class="btn btn-primary"/><br><br>
                    </form>
                   
                </div>

    <!-- Right Column -->
    <div class="col-md-3">
        
    </div>
</div>

                
  
              
    </body>
    </html>

