/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package backend;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author arash
 */
public class SendConfirmationMail {
      public void sendconfirmationmail(String toemail, String subject, String messageText) {
          System.out.println("Method called");
        final String fromEmail = "tahiralimahason@gmail.com";
        final String password = "xitdgfnxtgypncgu"; // App Password
           
        String toEmail=toemail;
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // ✅ Correct Session creation
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            msg.setSubject("No-Reply");
            msg.setText("Hi Thankyou for contacting us ,We solve your Query very soon");

            Transport.send(msg);
            System.out.println("✅ Email Sent Successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
