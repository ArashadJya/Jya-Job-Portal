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
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author arash
 */
public class EditProfileAbout extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2= (String) session.getAttribute("session_email");
        String name2=req.getParameter("name1");
        String gender2=req.getParameter("gender1");
        String city2=req.getParameter("city1");
        String title2=req.getParameter("title1");
        String Skills2=req.getParameter("skills1");
         
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
          int i1=  st.executeUpdate("update register set name='"+name2+"',gender='"+gender2+"',city='"+city2+"'  where email='"+email2+"'");
            
            Statement st1=con.createStatement();
          int i2=  st1.executeUpdate("update  about_user set about='"+title2+"',skills='"+Skills2+"' where email='"+email2+"' ");
          
          if(i1>0 &&i2>0){
              session.setAttribute("session_name", name2);
              session.setAttribute("session_email", email2);
              session.setAttribute("session_gender", gender2);
              session.setAttribute("session_city", city2);
              
              session.setAttribute("session_title", title2);
              
              session.setAttribute("session_skills", Skills2);
              resp.sendRedirect("profile.jsp");
          }
          else{
              RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
              rd1.include(req, resp);
              
              RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-about.jsp");
              rd2.include(req, resp);
          }
            
            
        }
        catch(Exception e){
            out.print(gender2.length());
            out.print(gender2);
            out.print(e);
        }
    }
    
    
}
