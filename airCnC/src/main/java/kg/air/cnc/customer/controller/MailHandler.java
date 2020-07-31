package kg.air.cnc.customer.controller;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.activation.DataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender javaMailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailHandler(JavaMailSender javaMailSender)throws MessagingException {
		this.javaMailSender = javaMailSender;
		message = this.javaMailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	public void setSubject(String subject) throws MessagingException{
		messageHelper.setSubject(subject);
	}
	
	public void setText(String content)throws MessagingException{
		messageHelper.setText(content, true);
	}
	
	public void setFrom(String email, String name)throws UnsupportedEncodingException, MessagingException{
		messageHelper.setFrom(email, name);
	}
	
	public void setTo(String email)throws MessagingException{
		messageHelper.setTo(email);
	}
	
	public void addInline(String contentId, DataSource dataSource)throws MessagingException{
		messageHelper.addInline(contentId, dataSource);
	}
}
