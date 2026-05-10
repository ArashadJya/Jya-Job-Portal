<%-- 
    Document   : profileHeader
    Created on : 3 Oct 2025, 10:49:09 am
    Author     : arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
    String gender=(String)session.getAttribute("session_gender");
      String image= (String) session.getAttribute("session_img_profile");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome: <jsp:expression> name </jsp:expression> </title>
         <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
       
         <div class="row header_bg">
                <div class="col-md-4 ">
                    <a href="index.jsp"> <img src="image/Jya Job Portal-logo.png" 
                         height="70px"  width="70px"style=" border-radius:50%" alt="Logo" />
                    <span class="logo_text_design" style="color: white; font-size: 20px; font-weight: bold; display: inline-block; vertical-align: middle; margin-left: 10px;">
                                            Jya Job Portal
                   </span></a> 
                </div>
                <div class="col-md-4">
                    <div style="margin-top: 25px"> 
                        <img src="profilepics/<jsp:expression>image</jsp:expression>"   height="50" width="50" style="border-radius: 50%" alt="alt"/>
                        
                        <a href="profile.jsp"> <jsp:expression> name </jsp:expression> </a> </div>

                 
                </div>
                <div class="col-md-4">
                    <div style="margin-top: 25px"><a href="logout" class="hyperlinks_design">Logout</a></div>
                </div>
            </div>
    </body>
</html>
