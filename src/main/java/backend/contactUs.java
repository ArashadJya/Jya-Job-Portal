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
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

/**
 *
 * @author arash
 */
public class contactUs  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String name=req.getParameter("name1");
       String email=req.getParameter("email1");
       String subject=req.getParameter("subject1");
       String message=req.getParameter("message1");
       
      Date d=new Date(0);
      
        SimpleDateFormat sdf1=new SimpleDateFormat("dd:MM:YYYY");
        String date1=sdf1.format(d);
        
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String date2=sdf2.format(d);
        Connection con=null;
        try{
          con=DBConnection.getConnect();
          con.setAutoCommit(false);
          
            PreparedStatement ps=con.prepareStatement("insert into contact_us(name,email,subject,message,date1) values(?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.setString(5, date1);
            
            int i=ps.executeUpdate();
            if(i>0){
                con.commit();
                
                    SendConfirmationMail sdf=new SendConfirmationMail();
              sdf.sendconfirmationmail(email,subject,message);
               
                RequestDispatcher rd1=req.getRequestDispatcher("success.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact_us.jsp");
                rd2.include(req, resp);
                
               
            }
            else{
                con.rollback();
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact_us.jsp");
                rd2.include(req, resp);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
            
            RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact_us.jsp");
                rd2.include(req, resp);
        }
    }
    
    
    
}
