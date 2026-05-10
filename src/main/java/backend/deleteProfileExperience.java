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
public class deleteProfileExperience extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String id=req.getParameter("edu");
        
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
           int i= st.executeUpdate("delete from experience where id='"+id+"'");
           if(i>0){
               resp.sendRedirect("profile.jsp");
           }
           else{
               resp.sendRedirect("error.jsp");
           }
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
