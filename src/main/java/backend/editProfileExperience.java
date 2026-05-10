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
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author arash
 */
public class editProfileExperience extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String id=req.getParameter("edu");
         
        String company=req.getParameter("company1");
        String Location=req.getParameter("Location1");
        String Years=req.getParameter("Year1");
        String JobTitle=req.getParameter("JobTitle1");
        String Description=req.getParameter("Description1");
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
            
          int i=  st.executeUpdate("update  experience set company='"+company+"',Location='"+Location+"',Years='"+Years+"',JobTitle='"+JobTitle+"',Description='"+Description+"'  where id='"+id+"'");
          if(i>0){
              resp.sendRedirect("profile.jsp");
          }
          else{
              resp.sendRedirect("editProfileExperience.jsp");
          }
            
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
