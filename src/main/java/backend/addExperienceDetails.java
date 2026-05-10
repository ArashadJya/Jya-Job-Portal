/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author arash
 */
public class addExperienceDetails  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();
        String email1= (String) session.getAttribute("session_email");
          
        String Company=req.getParameter("company1");
        String Location=req.getParameter("Location1");
        String Year=req.getParameter("Year1");
        String JObTitle=req.getParameter("JobTitle1");
        String Description=req.getParameter("Description1");
        
        try{
           Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
          int i=  st.executeUpdate("insert into experience (company,Location,Years,JobTitle,Description,email) values('"+Company+"','"+Location+"','"+Year+"','"+JObTitle+"','"+Description+"','"+email1+"')");
          if(i>0){
              resp.sendRedirect("profile.jsp");
          }
          else{
              resp.sendRedirect("addProfileExperience.jsp");
          }
        }
        catch(Exception e){
            out.print(e);
        }
        
    }
    
    
}
