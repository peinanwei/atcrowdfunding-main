package act;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAct02 {
	public static void main(String[] args) {
		
		// 获取Spring环境对象
		ApplicationContext application =
			new ClassPathXmlApplicationContext("spring/spring-*.xml");
		
		
		// 读取流程框架的核心对象
		ProcessEngine processEngine =
			(ProcessEngine)application.getBean("processEngine");
		
		// 将流程定义图形加载到流程框架中（加载到框架的数据库表中）
		// 获取持久化服务对象
		RepositoryService repositoryService =
			processEngine.getRepositoryService();
		
		// 部署
		DeploymentBuilder builer =
			repositoryService.createDeployment();
		
		Deployment deployment =
			builer.addClasspathResource("MyProcess1.bpmn").deploy();
		
		// DeploymentEntity
		/**
		 * act_re_deployment(1) : 部署信息表, 保存了当前部署信息（部署时间,ID）
		 * act_re_procdef(1) : 流程定义数据表, 保存了当前流程定义的相关信息（名称，ID，版本）
		 * act_ge_bytearray(2) : 二进制数据表, 保存了当前流程定义的文件及图形
		 */
		System.out.println( deployment );
	}
}
