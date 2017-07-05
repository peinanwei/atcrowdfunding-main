package test;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test02 {

	
	public static void main(String[] args) {
	
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/spring-*.xml");
		ProcessEngine processEngine = (ProcessEngine)ioc.getBean("processEngine");
		
		//持久化层服务
		RepositoryService repositoryService = processEngine.getRepositoryService();
		//获取运行时服务
		RuntimeService runtimeService = processEngine.getRuntimeService();
		//获取任务信息服务
		TaskService taskService = processEngine.getTaskService();
		
	}
}
