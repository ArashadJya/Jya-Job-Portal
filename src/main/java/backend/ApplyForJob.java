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
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author arash
 */
public class ApplyForJob extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String email= (String) session.getAttribute("session_email");
         
        String Jobid=req.getParameter("Jobid");
        int id=Integer.parseInt(Jobid);
        
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
        String date1=sdf.format(d);
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String time1=sdf2.format(d);
                try{
                    
                Connection con = DBConnection.getConnect();
                    PreparedStatement ps=con.prepareStatement("insert into applyjobs (email,Jobid,Date1,Time1) values(?,?,?,?)");
                    ps.setString(1, email);
                    ps.setInt(2, id);
                    ps.setString(3, date1);
                    ps.setString(4, time1);
                  int i=  ps.executeUpdate();
                  if(i>0){
                      RequestDispatcher rd=req.getRequestDispatcher("JobSucess.jsp");
                      rd.include(req, resp);
                      
                      RequestDispatcher rd1=req.getRequestDispatcher("DescriptionJob.jsp?jobid='"+id+"'");
                      rd1.include(req, resp);
                  }
                  else{
                       RequestDispatcher rd2=req.getRequestDispatcher("jobFailed.jsp");
                      rd2.include(req, resp);
                      
                      RequestDispatcher rd3=req.getRequestDispatcher("DescriptionJob.jsp");
                      rd3.include(req, resp);
                      
                  }
                  
                }
                catch(Exception e){
                    out.print(e);
                    
                }
                
                
        
    }
    
    
}
