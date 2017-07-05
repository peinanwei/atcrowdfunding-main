package act;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAct04 {

	public static void main(String[] args) {
		
		// 所谓的流程实例其实就是流程定义的具体应用
		ApplicationContext application =
				new ClassPathXmlApplicationContext("spring/spring-*.xml");
			
			
		// 读取流程框架的核心对象
		ProcessEngine processEngine =
			(ProcessEngine)application.getBean("processEngine");
		
		// 因为需要让流程运行起来,所以需要特定的服务对象
		RuntimeService runtimeService =
			processEngine.getRuntimeService();
		
		// 查询最新版本的流程定义对象
		ProcessDefinitionQuery query =
			processEngine.getRepositoryService().createProcessDefinitionQuery();
		ProcessDefinition processDefinition =
			query.processDefinitionKey("myProcess").latestVersion().singleResult();
		
		// 启动流程实例
		/**
		 * act_ru_execution : 运行时流程执行实例表
		 *                    保存了当前流程执行的节点数据，流程开始会自动完成，直接执行第一个任务
		 * act_ru_task : 运行时任务节点表
		 * 				 保存当前流程执行的任务数据
		 * act_hi_actinst : 历史节点表, 保存了流程执行的节点顺序
		 * act_hi_procinst : 历史流程实例表， 保存了流程实例的信息
		 * act_hi_taskinst : 历史任务实例表, 保存了流程任务的相关信息
		 */
		ProcessInstance pi =
			runtimeService.startProcessInstanceById(processDefinition.getId());
		
		System.out.println( "pi = " + pi );
	}

}
