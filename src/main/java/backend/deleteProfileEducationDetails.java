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
public class deleteProfileEducationDetails extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
                
        try{
           String id=req.getParameter("edu");
           Connection con=DBConnection.getConnect();
           Statement st=con.createStatement();
            int i =st.executeUpdate("delete from education where id='"+id+"'");
            if(i>0){
                resp.sendRedirect("profile.jsp");
            }
            else{
                out.print("failed");
            }
           
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
