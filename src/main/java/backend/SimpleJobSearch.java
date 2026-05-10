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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author arash
 */
public class SimpleJobSearch extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        String tech1=req.getParameter("techonology");
        
        Connection con=null;
        try{
            con=DBConnection.getConnect();
            PreparedStatement ps=con.prepareStatement("select*from jobs where job_profle like '%"+tech1+"%'");
//            ps.setString(1, tech1);
            ResultSet rs=ps.executeQuery();
             String jobProfile;
            while(rs.next()){
                    int id = rs.getInt("id");
                     jobProfile = rs.getString("job_profle");
                    String Company = rs.getString("company");
                    String Experience = rs.getString("Experience");
                    String Salary = rs.getString("salary"); 
                    String Description=rs.getString("Description");
                    String date1=rs.getString("date1");
                    String time=rs.getString("time1");
                    
                   out.print(
" <div style=\"border: 2px solid red; background: #f8f9fa; padding: 10px; margin-top: 20px;\">\n" +
"   <table>\n" +
"      <tr>\n" +
"         <td> <span class=\"glyphicon glyphicon-briefcase\"></span> </td>\n" +
"         <td><span style=\"font-size: 14px; color: gray;\">Job Profile:</span></td>\n" +
"         <td>" + jobProfile + "</td>\n" +
"      </tr>\n" +
"      <tr>\n" +
"         <td><span class=\"bi bi-building\"></span></td>\n" +
"         <td><span style=\"font-size: 14px; color: gray;\">Company:</span></td>\n" +
"         <td>" + Company + "</td>\n" +
"      </tr>\n" +
"      <tr>\n" +
"         <td><span class=\"bi bi-briefcase\"></span></td>\n" +
"         <td><span style=\"font-size: 14px; color: gray;\">Experience:</span></td>\n" +
"         <td>" + Experience + "</td>\n" +
"      </tr>\n" +
"      <tr>\n" +
"         <td><span class=\"bi bi-currency-dollar\"></span></td>\n" +
"         <td><span style=\"font-size: 14px; color: gray;\">Salary:</span></td>\n" +
"         <td>" + Salary + "</td>\n" +
"      </tr>\n" +
"      <tr>\n" +
"         <td></td>\n" +
"         <td></td>\n" +
"         <td><a href=\"DescriptionJob.jsp?Jobid=" + id + "\">See full details</a></td>\n" +
"      </tr>\n" +
"   </table>\n" +
" </div>"
);

                   
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
}
