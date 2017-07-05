package act;

import java.util.List;

import org.activiti.engine.HistoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import com.atguigu.atcrowdfunding.util.ActUtil;

public class TestAct12 {

	/**
	 * 测试并行网关
	 * @param args
	 */
	public static void main(String[] args) {

		ActUtil.deployment("MyProcess8.bpmn");
		
		ProcessInstance pi = 
				ActUtil.startProcessInstanceByKey("myProcess");
		
		TaskService taskService = 
				ActUtil.getProcessEngine().getTaskService();
		
		List<Task> taskZ = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		List<Task> taskL = taskService.createTaskQuery().taskAssignee("lisi").list();
		
		System.out.println("zhangsan任务的数量="+taskZ.size());
		System.out.println("lisi任务的数量="+taskL.size());
		
		for (Task task : taskZ) {
			
			System.out.println("zhangsan完成了任务"+task.getName());
			taskService.complete(task.getId());
		}
		
		//获取历史服务对象
		HistoryService historyService = ActUtil.getProcessEngine().getHistoryService();
		//历史查询服务对象
		HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery();
		//根据实例的id查询实例
		HistoricProcessInstance hpi = query.processInstanceId(pi.getId()).finished().singleResult();
		
		System.out.println("流程的id为"+pi.getId()+"是否结束 : "+(hpi != null));
		
		taskZ = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		taskL = taskService.createTaskQuery().taskAssignee("lisi").list();
		
		System.out.println("zhangsan任务的数量="+taskZ.size());
		System.out.println("lisi任务的数量="+taskL.size());
		
		for (Task task : taskL) {
					
			System.out.println("zhangsan完成了任务"+task.getName());
			taskService.complete(task.getId());
		}
		
		//获取历史服务对象
		historyService = ActUtil.getProcessEngine().getHistoryService();
		//历史查询服务对象
		query = historyService.createHistoricProcessInstanceQuery();
		//根据实例的id查询实例
		hpi = query.processInstanceId(pi.getId()).finished().singleResult();
		
		System.out.println("流程的id为"+pi.getId()+"是否结束 : "+(hpi != null));
	}

}
