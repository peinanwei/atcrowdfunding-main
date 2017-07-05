package test;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.atguigu.atcrowdfunding.util.ActUtil;
import com.atguigu.atcrowdfunding.util.DesUtil;

public class Test03 {

	public static void main(String[] args) {

		ActUtil.deployment("MyProcess3.bpmn");
		
		ActUtil.startProcessInstanceByKey("myProcess");
		
		System.out.println("S~~~~~~~~");
	}
	@Test
	public void testName() throws Exception {
		
		ApplicationContext application =  
				new ClassPathXmlApplicationContext("spring/spring-*.xml");
		
		JavaMailSenderImpl javaMailSender = 
				(JavaMailSenderImpl)application.getBean("sendMail");
		
		javaMailSender.setDefaultEncoding("UTF-8");
        MimeMessage mail = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail);
        helper.setSubject("标题");
        StringBuilder content = new StringBuilder();
        
        String param = "userid123";
        param = DesUtil.encrypt(param, "abcdefghijklmnopquvwxyz");
        
        content.append("<a href='http://www.atcrowdfunding.com/test/act.do?p="+param+"'>激活链接</a>");
        helper.setText(content.toString(), true);
        helper.setFrom("admin@atguigu.com");
        helper.setTo("test@atguigu.com");
        javaMailSender.send(mail);
        System.out.println("success");
	}

}
