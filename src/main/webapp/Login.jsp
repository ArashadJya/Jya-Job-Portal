<%-- 
    Document   : Login
    Created on : 2 Oct 2025, 7:43:40 am
    Author     : arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="checkCookie"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>
            <br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="text-align: center;background-color: aquamarine;">
                    <form method="post" action="login">
                         <h2>Login Here</h2> <br> 
                    <input type="text" placeholder="Enter Email" class="reglog_tf_design" name="email1"/><br> <br>
                    <input type="text" placeholder="Enter Password" class="reglog_tf_design" name="pass1"/><br> <br>
                    <input type="checkbox" name="rememberme1" value="rememberme"/>Remember Me <br><br>
                   
                    <input type="submit" value="Login" class="btn btn-primary"/><br><br>
                    </form>
                   
                </div>
                <div class="col-md-3"></div>
                
                
            </div>
            <br> <br>
            
            
            
            
            
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
