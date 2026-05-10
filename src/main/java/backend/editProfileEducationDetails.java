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
import jakarta.servlet.*;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author arash
 */
public class editProfileEducationDetails extends HttpServlet{
       
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String school=req.getParameter("School1");
        String Degree=req.getParameter("Degree1");
        String Year=req.getParameter("Year1");
        String Grade=req.getParameter("Grade1");
        String Description=req.getParameter("Description1");
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String id= (String) session.getAttribute("session_id");
        String email=(String)session.getAttribute("session_email");
        
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
            int i=st.executeUpdate("update education set school='"+school+"',Degree='"+Degree+"',Year='"+Year+"',Grade='"+Grade+"',Description='"+Description+"' where email='"+email+"' and id='"+id+"'");
            if(i>0){
                resp.sendRedirect("profile.jsp");
            }
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
