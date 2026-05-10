<%-- 
    Document   : simple-job-search
    Created on : 13 Nov 2025, 8:40:49 am
    Author     : arash
--%>

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
        <script>
            function searchJobByTechonology(tech){
                var obj;
//               1   create an XMLHttp Request Object
                if(window.XMLHttpRequest){
                     obj=new XMLHttpRequest();      //for latest browsers
                }
                else{
                     obj=new ActiveXObject("Microsoft.XMLHTTP");  //for old IE version
                }
//                2 specify the Request
                  obj.open("POST","SimpleJobSearch?techonology="+tech+"",true);
                  
//                  3 sends the request to the server
                   obj.send();
                   
//                   4 calls the function when the readystate property change
                        obj.onreadystatechange=function (){
                            if(obj.readyState===4 && obj.status===200){
                                document.getElementById('respgenerated').innerHTML=obj.responseText;
                            }
                        };
            }
            function searchJobByLocation(location){
                var obj;
//               1   create an XMLHttp Request Object
                if(window.XMLHttpRequest){
                     obj=new XMLHttpRequest();      //for latest browsers
                }
                else{
                     obj=new ActiveXObject("Microsoft.XMLHTTP");  //for old IE version
                }
//                 2 specify the Request
                  obj.open("POST","SimpleJobSearchByLocation?Location="+location+"",true);
                  
//                  3 sends the request to the server
                   obj.send();
                   
//                   4 calls the function when the readystate property change
                        obj.onreadystatechange=function (){
                            if(obj.readyState===4 && obj.status===200){
                                document.getElementById('respgenerated').innerHTML=obj.responseText;
                            }
                        };
                  
            }
        </script>
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
            <br>  <br>
            <!--search division job starts-->
        <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 job-search-div">
                    <br>
                    <h4>Find A job at India No. 1 Job Site </h4> <br> 
                    <input type="text" placeholder="Enter  Techonology" class="textfielddesign"  onkeyup="searchJobByTechonology(this.value)"/><br> <br>
                    OR  <br>  <br>
                    <input type="text" placeholder="Location" class="textfielddesign" onkeyup="searchJobByLocation(this.value)"/> <br> <br>
                </div>
                <div class="col-md-2"></div>
                    
        </div>
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
    <div class="col-md-6" style="background-color: rgb(204, 255, 255); margin-top: 30px;">
        <div class="row">
            <div class="col-md-12">
                <span id="respgenerated"> No Result Found </span> 
            </div>
                
            </div>
            
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
