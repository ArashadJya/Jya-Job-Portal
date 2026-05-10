/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

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
public class register extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
     resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String name2=req.getParameter("name1");
        String email2=req.getParameter("email1");
        String pass2=req.getParameter("pass1");
        String gender2=req.getParameter("gender");
        String[] field2=req.getParameterValues("field1");
        String city2=req.getParameter("city1");      
        String fields2="";
        for(String s:field2){
            fields2=s+","+fields2;
        }
        
        try{
//              HttpSession create database se get kiye gaye value ko seeeion me initialize karne ke liye
             Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
         int i=  st.executeUpdate("insert into register (name,email,password,gender,field,city) values('"+name2+"','"+email2+"','"+pass2+"','"+gender2+"','"+fields2+"','"+city2+"')");
         int i1=st1.executeUpdate("insert into about_user (email,about,skills) values('"+email2+"','','') ");
         PreparedStatement ps=con.prepareStatement("insert into profile_pics (email,path) values(?,?)");
         ps.setString(1, email2);
         ps.setString(2,"profile-img.jpeg" );
       int i2=  ps.executeUpdate();
         
         
           if(i>0 && i1>0 &&i2>0){
               
               resp.sendRedirect("profile.jsp");
           }
                 HttpSession session=req.getSession();
                 //isme ham hm request.getSession likhtehai iska matalab hota hai ki server dekhta hai ki current request ke sath koi session id create hui hai agar create hui hai to is session object ko usi session par create kar deta hai and agar create nhi hui hai to wah naya session object created kar deta hai
               session.setAttribute("session_name", name2);
               session.setAttribute("session_gender", gender2);
               session.setAttribute("session_email", email2);
               session.setAttribute("session_city", city2);
               session.setAttribute("session_field",fields2);
               
         session.setAttribute("session_img_profile","profile-img.jpeg" );
               
                session.setAttribute("session_title", "");
              session.setAttribute("session_skills", "");
            
           
         
        }
        catch(Exception e){
            out.print(e);
        }
    }
    
    
}
