/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author arash
 */
public class addProfileEducationDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2= (String)session.getAttribute("session_email");
        
        String school2=req.getParameter("School1");
        String Degree2=req.getParameter("Degree1");
        String Year2=req.getParameter("Year1");
        String Grade2=req.getParameter("Grade1");
        String Description2=req.getParameter("Description1");
        
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
            
            int i=st.executeUpdate("insert into education (email,school,Degree,Year,Grade,Description) values('"+email2+"','"+school2+"','"+Degree2+"','"+Year2+"','"+Grade2+"','"+Description2+"' ) ");
            
            if(i>0){
//               
//                   session me attribute set ho gaya ab session se value get kar lenge
                resp.sendRedirect("profile.jsp");
            }
            else{
                RequestDispatcher rd=req.getRequestDispatcher("error.jsp");
                rd.include(req, resp);
                
                RequestDispatcher rd1=req.getRequestDispatcher("edit-profile-education.jsp");
                rd1.include(req, resp);
                
            }
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
