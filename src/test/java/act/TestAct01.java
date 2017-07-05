package act;

import org.activiti.engine.ProcessEngine;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAct01 {

	public static void main(String[] args) {
		
		// 获取Spring环境对象
		ApplicationContext application =
			new ClassPathXmlApplicationContext("spring/spring-*.xml");
		
		
		// 读取流程框架的核心对象
		ProcessEngine processEngine =
			(ProcessEngine)application.getBean("processEngine");
		
		// ProcessEngineImpl
		System.out.println( "流程框架的核心对象 = " + processEngine );
	}

}
