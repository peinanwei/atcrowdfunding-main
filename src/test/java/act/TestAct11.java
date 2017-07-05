package act;

import java.util.List;

import org.activiti.engine.HistoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import com.atguigu.atcrowdfunding.util.ActUtil;

public class TestAct11 {

	/**
	 * 测试排他网关
	 * @param args
	 */
	public static void main(String[] args) {
		ActUtil.deployment("MyProcess6.bpmn");
		
		ProcessInstance pi = ActUtil.startProcessInstanceByKey("myProcess");
		
		//获取任务服务,可以根据执行者,Group查询任务集合
		TaskService taskService = ActUtil.getProcessEngine().getTaskService();
		
		List<Task> tasks = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		List<Task> tasks1 = taskService.createTaskQuery().taskAssignee("lisi").list();
		
		System.out.println( "zhangsan的任务数量 = " + tasks.size() );
		System.out.println( "lisi的任务数量 = " + tasks1.size() );
		
		for ( Task task : tasks ) {
			System.out.println( "zhangsan完成了任务 = " + task.getName() );
			taskService.complete(task.getId());
		}
		
		//获取历史对象
		HistoryService historyService = 
				ActUtil.getProcessEngine().getHistoryService();
		//获取历史查询对象
		HistoricProcessInstanceQuery query = 
				historyService.createHistoricProcessInstanceQuery();
		//查询出来历史实例,是否完成
		HistoricProcessInstance hpi = 
				query.processInstanceId(pi.getId()).finished().singleResult();
		
	}
}
