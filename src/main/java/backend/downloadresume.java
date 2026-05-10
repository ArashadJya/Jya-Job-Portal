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
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

/**
 *
 * @author arash
 */
public class downloadresume extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OutputStream out=resp.getOutputStream();
        HttpSession session=req.getSession();
        String file_name= (String) session.getAttribute("session_filename");
        resp.setHeader("content-Disposition", "attchment; filename=\""+file_name);
        
        FileInputStream fis=new FileInputStream(pathDetails.Resume_Path+file_name);
        int i;
        while((i=fis.read())!=-1){
            out.write(i);
            
        }
        fis.close();
        out.close();
    }
    
    
}
