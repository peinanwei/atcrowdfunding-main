package act;

import java.util.List;

import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;

import com.atguigu.atcrowdfunding.util.ActUtil;

/**
 * 变量
 *
 */
public class TestAct06{
	
	public static void main(String[] args) {
		
		//部署任务
//		ActUtil.deployment("MyProcess5.bpmn");
		
		//执行获取流程实例
//		ProcessInstance pi = 
//				ActUtil.startProcessInstanceByKey("myProcess");
		
		//获取查询服务
		TaskService taskService = 
				ActUtil.getProcessEngine().getTaskService();
		//创建查询对象
		TaskQuery taskQuery = 
				taskService.createTaskQuery();
		
		//根据执行人获取task集合
		List<Task> taskZ = 
				taskQuery.taskAssignee("zhangsan").list();
		List<Task> taskL = 
				taskQuery.taskAssignee("lisi").list();
		
		System.out.println("zhangsan的任务数量 ="+taskZ.size());
		System.out.println("lisi的任务数量 ="+taskL.size());
		
		for (Task task : taskZ) {
			taskService.complete(task.getId());
			System.out.println("zhangsan完成了任务 >"+task.getName() );
		}
		
		taskZ = 
				taskQuery.taskAssignee("zhangsan").list();
		taskL = 
				taskQuery.taskAssignee("lisi").list();
		
		System.out.println("zhangsan的任务数量 ="+taskZ.size());
		System.out.println("lisi的任务数量 ="+taskL.size());
		
		for (Task task : taskL) {
			taskService.complete(task.getId());
			System.out.println("lisi完成了任务 >"+task.getName() );
		}
		
		taskZ = 
				taskQuery.taskAssignee("zhangsan").list();
		taskL = 
				taskQuery.taskAssignee("lisi").list();
		
		System.out.println("zhangsan的任务数量 ="+taskZ.size());
		System.out.println("lisi的任务数量 ="+taskL.size());
	}
}