/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author arash
 */
public class validatonServerSide {
    private Pattern name;
    private Pattern email;
    private Pattern password;
    
    private Matcher matcher;
    
    private static final String Name_pattern="^[a-zA-Z ]{3,30}$";
    private static final String Email_pattern="^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final String password_pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,20}$";
    
    public validatonServerSide(){
        name=Pattern.compile(Name_pattern);
        email=Pattern.compile(Email_pattern);
        password=Pattern.compile(password_pattern);
    }
    public  boolean  nameValidate(final String name1){
        matcher=name.matcher(name1);
        return matcher.matches();
    }
    public  boolean  emailValidate(final String email1){
        matcher=email.matcher(email1);
        return matcher.matches();
    }

   
    public  boolean  passwordValidate(final String pass1){
        matcher=password.matcher(pass1);
        return matcher.matches();
    }
    
    
    
}
