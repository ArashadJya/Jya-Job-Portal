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
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author arash
 */
public class deleteApplyjobs extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String email= (String) session.getAttribute("session_email");
        String id=req.getParameter("Jobid");
        int ids=Integer.parseInt(id);
        try{
            Connection con=DBConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("delete from applyjobs where email=? and Jobid=?");
            ps.setString(1, email);
            ps.setInt(2, ids);
            int i=ps.executeUpdate();
            if(i>0){
                resp.sendRedirect("myAppliedJobs.jsp");
            }
            else{
                RequestDispatcher rd=req.getRequestDispatcher("error.jsp");
                rd.include(req, resp);
                RequestDispatcher rd1=req.getRequestDispatcher("DescriptionJob.jsp");
                rd.include(req, resp);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    
}
