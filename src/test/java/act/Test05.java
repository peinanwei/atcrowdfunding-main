package act;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test05 {

	public static void main(String[] args) {
		// 通过任务服务对象，让流程继续执行
		ApplicationContext application =
				new ClassPathXmlApplicationContext("spring/spring-*.xml");
			
			
		// 读取流程框架的核心对象
		ProcessEngine processEngine =
			(ProcessEngine)application.getBean("processEngine");
		
		TaskService taskService =
			processEngine.getTaskService();
		
		// 查询任务，完成任务
		TaskQuery query = taskService.createTaskQuery();
		List<Task> tasks = query.list();
		
		for ( Task task : tasks ) {
			System.out.println( "完成任务 = " + task.getName() );
			taskService.complete(task.getId());
		}
	}

}
