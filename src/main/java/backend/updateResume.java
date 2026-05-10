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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.jakarta.JakartaServletDiskFileUpload;

/**
 * Fully working Upload Resume servlet
 * Author: arash
 */
public class updateResume extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter out=resp.getWriter();

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");
        if (email == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String resume_name = null;

        // 1️⃣ File Upload
        try {
            DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
            JakartaServletDiskFileUpload sfu = new JakartaServletDiskFileUpload(factory);
            List<DiskFileItem> items = sfu.parseRequest(req);

            for (FileItem item : items) {
                if (!item.isFormField()) { // Only file
                    resume_name = new File(item.getName()).getName();

                    // Ensure folder exists
                    File folder = new File(pathDetails.Resume_Path);
                    if (!folder.exists()) folder.mkdirs();

                    File f1 = new File(folder, resume_name);
                    item.write(f1.toPath());
                    break; // Only first file
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
            return;
        }

        // 2️⃣ DB Insert/Update
        try  {
            Connection con = DBConnection.getConnect();
//            con.setAutoCommit(false);
            int result = 0;

            PreparedStatement ps1 = con.prepareStatement("SELECT * FROM resume WHERE email=?");
            ps1.setString(1, email);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                PreparedStatement ps2 = con.prepareStatement(
                        "UPDATE resume SET `path`=? WHERE email=?"
                );
                ps2.setString(1, resume_name);
                ps2.setString(2, email);
                result = ps2.executeUpdate();
            } else {
                PreparedStatement ps3 = con.prepareStatement(
                        "INSERT INTO resume (email, `path`) VALUES (?, ?)"
                );
                ps3.setString(1, email);
                ps3.setString(2, resume_name);
                result = ps3.executeUpdate();
            }

            if (result > 0) {
//                con.commit();
                resp.sendRedirect("profile.jsp"); // ✅ Safe redirect
            } else {
//                con.rollback();
                resp.sendRedirect("error.jsp");
            }
        } catch (Exception ee) {
            out.print(ee);
        }
    }
}
