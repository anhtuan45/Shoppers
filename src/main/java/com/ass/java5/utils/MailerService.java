package com.ass.java5.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class MailerService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String toEmail , String subject , String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("anhtuan45201@gmail.com");
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);
		
		mailSender.send(message);
		
		System.out.println("Mail send sucessfully !!");
	}
	
//	@Autowired
//	JavaMailSender mailSender;
//	
//	List<MimeMessage> queue = new ArrayList<MimeMessage>();
//	
//	public void push(String to, String subject, String body) throws MessagingException {
//		MailModel mail = new MailModel(to, subject, body);
//		this.push(mail);
//	}
//	
//	public void push(MailModel mail) throws MessagingException {
//		MimeMessage message = mailSender.createMimeMessage();
//		MimeMessageHelper helper = new MimeMessageHelper(message);
//		helper.setFrom(mail.getForm());
//		helper.setTo(mail.getTo());
//		helper.setSubject(mail.getSubject());
//		helper.setText(mail.getBody());
//		
//		for (String ccAdress : mail.getCc()) {
//			helper.addCc(ccAdress);
//		}
//		
//		for (String bccAdress : mail.getBcc()) {
//			helper.addCc(bccAdress);
//		}
//		
//		for (File fileAtt : mail.getFiles()) {
//			helper.addAttachment(fileAtt.getName(), fileAtt);
//		}
//
//		queue.add(message);
//	}
//	
//	
//	int success = 0;
//	int failed = 0;
//	@Scheduled(fixedRate = 10000)
//	public void sendEmailInqueue() {
//
//		try {
//			if (!queue.isEmpty()) {
//				MimeMessage fistOut = queue.remove(0);
//				mailSender.send(fistOut);
//				success++;
//			}
//		} catch (Exception e) {
//			failed++;
//		}
//		System.out.println("Mail success: "+success+" failed: "+failed);
//	}
	
}
