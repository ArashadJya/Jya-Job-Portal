<%-- 
    Document   : menubar
    Created on : 30 Sept 2025, 11:37:13 am
    Author     : arash
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email= (String) session.getAttribute("session_email");
    String id=  (String) request.getAttribute("Jobid");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <div class="row menubar-second">
                <div class="col-md-7" >
                    <ul id="mynavbar">
                        <li><a href="index.jsp">Home</a></li>
                         <%            if (email == null ? email == null : email.trim().equals("null")) {

        %>
        <%        } else {
                         
        %>
        <li> <a href="myAppliedJobs.jsp">My Applied jobs</a> </li>            
        
        <%
            }
        %>
         <li><a href="simple-job-search.jsp">Search Jobs</a></li>
                        <li><a href="companies.jsp">Companies</a></li>
                        
                        
                    </ul>
                </div>
                <div class="col-md-5" >
                    <ul id="mynavbar">
                        
                       <li><a href="about-us.jsp">About Us</a></li>
                        <li><a href="contact_us.jsp">Contact Us</a></li>
                    </ul>
                    
                </div>
                
            </div>
      
    </body>
</html>
