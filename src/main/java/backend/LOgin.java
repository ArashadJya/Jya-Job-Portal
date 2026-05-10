/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class LOgin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String email2=req.getParameter("email1");
        String pass2=req.getParameter("pass1");
        String remme2=req.getParameter("rememberme1");
        
//        instance varibale declared if part ke andar database se value get karne ke liye
            String name2="",gender2="",city2="",fields2="";
            //close
        
        try{
            Connection con=DBConnection.getConnect();
            Statement st=con.createStatement();
           ResultSet rs= st.executeQuery("select *from register where email='" +email2+ "'and password='" +pass2+ "'" );
           if(rs.next()){
              if("rememberme".equals(remme2)){
                  Cookie ck1=new Cookie("cookie_email", email2);
                  ck1.setMaxAge(60*60*24*365);
                  resp.addCookie(ck1);
                  
                  Cookie ck2=new Cookie("cookie_status", "true");
                  ck2.setMaxAge(60*60*24*365);
                  resp.addCookie(ck2);
              }
               
//              upar declare kiya tha jo value usme value get hona start database se 
               name2=rs.getString("name");
               gender2=rs.getString("gender");
               city2=rs.getString("city");
               fields2=rs.getString("field");
               //close
//                HttpSession create database se get kiye gaye value ko seeeion me initialize karne ke liye
                 HttpSession session=req.getSession();
                 //isme ham hm request.getSession likhtehai iska matalab hota hai ki server dekhta hai ki current request ke sath koi session id create hui hai agar create hui hai to is session object ko usi session par create kar deta hai and agar create nhi hui hai to wah naya session object created kar deta hai
               session.setAttribute("session_name", name2);
               session.setAttribute("session_gender", gender2);
               session.setAttribute("session_email", email2);
               session.setAttribute("session_city", city2);
               session.setAttribute("session_field",fields2);
               session.setAttribute("session_profile_img","image/profile-img.jpeg");
               
               String Tittle = "",skills="";
             ResultSet rs1= st.executeQuery("select *from about_user where email='" +email2+ "'" );
             while(rs1.next()){
                 Tittle=rs1.getString("about");
                 skills=rs1.getString("skills");
             }
                 
                session.setAttribute("session_title", Tittle);
              session.setAttribute("session_skills", skills);
               
              
              ResultSet rs2=st.executeQuery("select*from profile_pics where email='"+email2+"'");
              if(rs2.next()){
                  String paths=rs2.getString("path");
               session.setAttribute("session_img_profile", paths);
                resp.sendRedirect("profile.jsp");
              }
           }
           else{
               
               RequestDispatcher rd3=req.getRequestDispatcher("LoginError.jsp");
               rd3.include(req, resp);
               RequestDispatcher rd4=req.getRequestDispatcher("Login.jsp");
               rd4.include(req, resp);
             
           }
           
        }
        catch(Exception e){
           out.print(e);
        }
        
        
    }

  
    
}
