/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

/**
 *
 * @author arash
 */
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.jakarta.JakartaServletDiskFileUpload;
public class updateProfilePic extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
            
            HttpSession session=req.getSession();
          String email= (String) session.getAttribute("session_email");
           String file_name=null;
        try {
            DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
            JakartaServletFileUpload sfu = new JakartaServletDiskFileUpload(factory);
              
            List<FileItem> items=sfu.parseRequest(req);
            FileItem item=items.get(0);
            String File_path=item.getName();
            File file=new File(File_path);
             file_name=file.getName();
             
             
            File f1 = new File(pathDetails.Profile_Pic_Path + file_name);
             item.write(f1.toPath());
            }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        try{
          Connection con=DBConnection.getConnect();
          con.setAutoCommit(false);
          
            PreparedStatement ps=con.prepareStatement("update profile_pics set path=? where email=?");
            ps.setString(1, file_name);
            ps.setString(2, email);
           int i= ps.executeUpdate();
           if(i>0){
           session.setAttribute("session_img_profile", file_name);
               con.commit();
               resp.sendRedirect("profile.jsp");
           }
           else{
               con.rollback();
               RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
               rd1.include(req, resp);
               
               RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-img.jsp");
               rd2.include(req, resp);
               
               
           }
            
          
        }
        catch(Exception ee){
            
        }
    }
}

