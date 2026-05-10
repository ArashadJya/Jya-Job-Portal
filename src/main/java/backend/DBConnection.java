/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author arash
 */
public class DBConnection {
   static  Connection con;
    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","44@@");
        }
        catch(Exception e){
            System.out.print(e);
        }
    }
    public  static  Connection getConnect(){
        return con;
    }
    
}
