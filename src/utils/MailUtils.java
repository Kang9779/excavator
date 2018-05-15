package utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;

public class MailUtils {

	public static void sendMail(String email, String emailMsg)
			throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();
		//设置发送的协议
		props.setProperty("mail.transport.protocol", "smtp");

		//设置发送邮件的服务器
		props.setProperty("mail.host", "smtp.163.com");
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true

		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				//设置发送人的帐号和密码
				return new PasswordAuthentication("kangzhang_seu", "zq31279jk");
			}
		};

		Session session = Session.getInstance(props,auth);
		Transport ts = session.getTransport();
		ts.connect("smtp.163.com","kangzhang_seu","zq31279jk");

		System.out.println("调试邮件代码");
		// 2.创建一个Message，它相当于是邮件内容
		MimeMessage message = new MimeMessage(session);

		//设置发送者
		message.setFrom(new InternetAddress("kangzhang_seu@163.com"));

		//设置发送方式与接收者
		message.setRecipient(RecipientType.TO, new InternetAddress(email));

		//设置邮件主题
		message.setSubject("用户激活");
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

		//设置邮件内容
		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送
		ts.sendMessage(message,message.getAllRecipients());
		ts.close();
	}
}
