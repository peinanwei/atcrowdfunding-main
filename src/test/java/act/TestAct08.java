package act;

import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;

import com.atguigu.atcrowdfunding.util.ActUtil;

/**
 *获取历史纪录
 *
 */
public class TestAct08 {

	public static void main(String[] args) {
		
		//获取历史记录对象
		HistoryService historyService = 
				ActUtil.getProcessEngine().getHistoryService();
		
		//历史对象获取查询对象
		HistoricProcessInstanceQuery Query = 
				historyService.createHistoricProcessInstanceQuery();
		
		//根据id获取历史实例对象
		HistoricProcessInstance result = 
				Query.processInstanceId("801").finished().singleResult();
		System.out.println("401的历史记录="+result);
		
	}

}
