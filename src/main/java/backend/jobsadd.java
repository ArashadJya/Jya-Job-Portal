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
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author arash
 */
public class jobsadd extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        
        String JobProfile=req.getParameter("jobProfile1");
        String Company=req.getParameter("company1");
        String Salary=req.getParameter("salary1");
        String Experience=req.getParameter("experience1");
        String No_Of_Openings=req.getParameter("openings1");
        String TimeVenue=req.getParameter("timevenue1");
        String Description=req.getParameter("description1");
        String Company_email=req.getParameter("cemail1");
        String Company_personName=req.getParameter("cpName1");
        String Company_phoneNo=req.getParameter("cPhone1");
        String Date=req.getParameter("date1");
        String Time=req.getParameter("time1");
        String Company_personProfile=req.getParameter("cpProfile1");
        String Location=req.getParameter("Location1");
        
        try{
            Connection con=DBConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("insert into jobs (job_profle,company,Experience,salary,no_of_openings,time_venue,Description,company_email,Company_personName,company_phoneNo,date1,time1,company_personProfile,Location) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, JobProfile);
            ps.setString(2, Company);
            ps.setString(3, Salary);
            ps.setString(4, Experience);
            ps.setString(5, No_Of_Openings);
            ps.setString(6, TimeVenue);
            ps.setString(7, Description);
            ps.setString(8, Company_email);
            ps.setString(9, Company_personName);
            ps.setString(10, Company_phoneNo);
            ps.setString(11, Date);
            ps.setString(12, Time);
            ps.setString(13, Company_personProfile);
            ps.setString(14, Location);
            int  i=ps.executeUpdate();
            if(i>0){
                RequestDispatcher rd=req.getRequestDispatcher("JobsAddSucess.jsp");
                rd.include(req, resp);
                RequestDispatcher rd1=req.getRequestDispatcher("index.jsp");
                rd1.include(req, resp);
            }
        }
        catch(Exception e){
           out.print(e); 
        }
        
        
    }
    
    
}
