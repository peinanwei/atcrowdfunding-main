package act;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import com.atguigu.atcrowdfunding.util.ActUtil;

public class TestAct10 {

	public static void main(String[] args) {
		ActUtil.deployment("MyProcess7.bpmn");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("days", 5);
		
		ProcessInstance pi = ActUtil.getProcessEngine()
			.getRuntimeService()
				.startProcessInstanceByKey("myProcess", map);
		
		
		//查询任务
		TaskService taskService = ActUtil.getProcessEngine().getTaskService();
		List<Task> taskZ = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		List<Task> taskL = taskService.createTaskQuery().taskAssignee("lisi").list();
		
		System.out.println("zhangsan的任务="+taskZ.size());
		System.out.println("lisi的任务="+taskL.size());
		
		for (Task task : taskZ) {
			taskService.complete(task.getId());
			System.out.println("zhansgan完成了任务>"+task.getName());
		}
		
		//判断流程是否结束
		HistoryService historyService =
				ActUtil.getProcessEngine().getHistoryService();
			
		HistoricProcessInstanceQuery query =
			historyService.createHistoricProcessInstanceQuery();
		
		HistoricProcessInstance hpi =
			query.processInstanceId(pi.getId()).finished().singleResult();
		
		System.out.println( "流程" + pi.getId() + "是否结束 : " + (hpi != null) );
		
		taskZ = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		taskL = taskService.createTaskQuery().taskAssignee("lisi").list();
		
		System.out.println( "zhangsan的任务数量 = " + taskZ.size() );
		System.out.println( "lisi的任务数量 = " + taskL.size() );
		
		for ( Task task : taskL ) {
			System.out.println( "lisi完成了任务 = " + task.getName() );
			taskService.complete(task.getId());
		}
		
		historyService =
			ActUtil.getProcessEngine().getHistoryService();
		
		query =
			historyService.createHistoricProcessInstanceQuery();
		
		hpi =
			query.processInstanceId(pi.getId()).finished().singleResult();
		
		System.out.println( "流程" + pi.getId() + "是否结束 : " + (hpi != null) );
	}

}
