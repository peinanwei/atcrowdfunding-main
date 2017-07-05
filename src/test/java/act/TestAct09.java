package act;

import java.util.List;

import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import com.atguigu.atcrowdfunding.util.ActUtil;

public class TestAct09 {
	/**
	 *将任务分配给小组,小组分配给个人 
	 */
	public static void main(String[] args) {
		ActUtil.deployment("MyProcess6.bpmn");
		
		ProcessInstance processInstance = 
				ActUtil.startProcessInstanceByKey("myProcess");
		//查询任务
		TaskService taskService = 
				ActUtil.getProcessEngine().getTaskService();
		List<Task> tasks = 
				taskService.createTaskQuery().taskCandidateGroup("manager").list();
		
		for (Task task : tasks) {
			taskService.claim(task.getId(), "tianqi");
		}
		
		long count = taskService.createTaskQuery().taskAssignee("tianqi").count();
		System.out.println(count);
	}
}
