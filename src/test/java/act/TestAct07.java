package act;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;

import com.atguigu.atcrowdfunding.util.ActUtil;

/**
 * group入参
 *
 */
public class TestAct07 {

	public static void main(String[] args) {

		ActUtil.deployment("MyProcess4.bpmn");

		//需要传入参数此时这种获取实例的方法就不适用了
//		ProcessInstance pi = 
//				ActUtil.startProcessInstanceByKey("myProcess");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("manager", "zhangsan");
		map.put("member", "lisi");
		
		ProcessInstance pi = 
				ActUtil.getProcessEngine()
					.getRuntimeService()
						.startProcessInstanceByKey("myProcess", map);
		System.out.println("success");
	}

}
