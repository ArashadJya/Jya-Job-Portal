/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import java.io.IOException;
import java.net.Authenticator;

/**
 *
 * @author arash
 */
public class ValidationFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
         String name2=request.getParameter("name1");
        String email2=request.getParameter("email1");
        String pass2=request.getParameter("pass1");
        String gender2=request.getParameter("gender");
        String[] field2=request.getParameterValues("field1");
        String city2=request.getParameter("city1");      
        String fields2="";
        for(String s:field2){
            fields2=s+","+fields2;
        }
        validatonServerSide validation=new validatonServerSide();
        if(!validation.nameValidate(name2)){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
        }
       else if(!validation.emailValidate(email2)){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
            
        }
       else if(!validation.passwordValidate(pass2)){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
            
        }
       else if(gender2==null ||gender2.equals("")){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
            
        }
       else if(city2==null ||city2.equals("")){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
            
        }
       else if(fields2==null ||fields2.equals("")){
            RequestDispatcher rd1=request.getRequestDispatcher("registers.jsp");
            rd1.include(request, response);
            
        }
       else{
           chain.doFilter(request, response);
       }
        
    }

    @Override
    public void destroy() {
    }
    
    
}
