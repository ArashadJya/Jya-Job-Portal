<%-- 
    Document   : DescriptionJob
    Created on : 26 Oct 2025, 6:14:58 pm
    Author     : arash
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="backend.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String email = (String) session.getAttribute("session_email");
   String ids =   request.getParameter("Jobid");
   int id= Integer.parseInt(ids);
   


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <!--jQuery--> 
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--Bootstrap JS--> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/style.css"/>

        <title>JSP Page</title>
    </head>
    <body>
        <%            if (email == null ? email == null : email.trim().equals("null")) {

        %>
        <jsp:include page="header.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="profileHeader.jsp"></jsp:include>
        <%
            }
        %>

        <jsp:include page="menubar.jsp"></jsp:include>
            <br>

            <div class="row">
                <div class="col-md-3"> </div>

                <div class="col-md-6" >

                <%
                    String jobProfile="",Company="",Experience="",Salary="",No_of_Opening="",TimeVenue="",Description="",Company_email="",Company_personName="",company_phoneNo="",Date="",Time="",company_personProfile="";
                    try {

                        Connection con = DBConnection.getConnect();
                        PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
                        ps.setInt(1, id);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                             jobProfile = rs.getString("job_profle");
                             Company= rs.getString("company");
                              Experience = rs.getString("Experience");
                             Salary = rs.getString("salary");
                             No_of_Opening = rs.getString("no_of_openings");
                             TimeVenue = rs.getString("time_venue");
                             Description = rs.getString("Description");
                             Company_email = rs.getString("company_email");
                             Company_personName = rs.getString("Company_personName");
                             company_phoneNo = rs.getString("company_phoneNo");
                             Date = rs.getString("date1");
                             Time = rs.getString("time1");
                             company_personProfile = rs.getString("company_personProfile");
                    }

                %>
                <div style="border: 2px solid red; background-color: aliceblue; box-shadow: 5px 5px 5px;" >



                    <table>
                        <tr>

                            <td> <span style="font-size: 14px; color: gray;">Job Profile</span> </td>
                            <td> <%=jobProfile%> (<%=No_of_Opening%> Vacency) </td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Company</span> </td>
                            <td> <%=Company%></td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Experience</span> </td>
                            <td><%=Experience%></td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Salary</span> </td>
                            <td><%=Salary%></td>
                        </tr>


                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Description </span> </td>
                            <td><%=Description%></td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Email</span> </td>
                            <td><%=Company_email%></td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Name</span>  </td>
                            <td><%=Company_personName%> (<%=company_personProfile%>) </td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Phone No</span> </td>
                            <td><%=company_phoneNo%></td>
                        </tr>
                        <tr>
                            <td> <span style="font-size: 14px; color: gray;">Date & Time</span> </td>
                            <td>(<%=Date%> & <%=Time%>)</td>
                        </tr>

                        <%
                            if (email == null ? email == null : email.trim().equals("null")) {

                        %>        

                        <tr>
                            <td></td>
                            <td> <a href="Login.jsp" class="btn btn-danger"> Login and Apply</a>  </td>
                        </tr>
                       <% } else {
                            PreparedStatement ps1 = con.prepareStatement("select*from applyjobs where email=? and Jobid=?");
                            ps1.setString(1, email);
                            ps1.setInt(2, id);
                            ResultSet rs1 = ps1.executeQuery();
                            if (rs1.next()) {
                        %>  

                        <tr>
                            <td></td>
                            <td> <h4 style="color: red;font-size: 14px;"> Already applied</h4> 
                                                        <br>
                                                        <form action="deleteappliedjobs" method="Post">
                                                            <input type="hidden" value="<%=id%>" name="Jobid"/>
                                                            
                                                        <input type="submit"  value="Delete applied jobs" class="btn btn-danger"/>                        
                                                        </form>

                            </td>
                        </tr>
                        <%
                        } else {
                        %>

                        <tr>
                            <td></td>
                            <td> 

                                <form action="ApplyforJob" method="post"> 
                                    <input type="hidden" value="<%=id%>" name="Jobid" /> 
                                        <input type="submit" value=" Apply" class="btn btn-success"/>
                                    </form>


                                </td>
                            </tr>



                        <%
                            }
                            }
                        %>


                    </table>
                </div>


                <%
                            

                      }
                      catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
                    }
                %>
            </div>
            <div class="col-md-3"></div>

        </div>
            <br>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
