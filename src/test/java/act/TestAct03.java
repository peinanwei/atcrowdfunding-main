package act;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAct03 {

	public static void main(String[] args) {
		// 查询流程定义
		ApplicationContext application =
				new ClassPathXmlApplicationContext("spring/spring-*.xml");			
			
		// 读取流程框架的核心对象
		ProcessEngine processEngine =
			(ProcessEngine)application.getBean("processEngine");
		
		// 查询 (持久化服务对象)
		RepositoryService repositoryService =
			processEngine.getRepositoryService();
		
		ProcessDefinitionQuery query =
			repositoryService.createProcessDefinitionQuery();
		
		// 获取集合数据
		List<ProcessDefinition> processDefinitions =
			query.list();
		
//		for ( ProcessDefinition pd : processDefinitions ) {
//			System.out.println( pd.getName() + "," + pd.getKey() + "," + pd.getVersion() );
//		}
		
		// 根据条件获取数据
		//processDefinitions = query.processDefinitionVersion(2).list();
		
//		for ( ProcessDefinition pd : processDefinitions ) {
//			System.out.println( pd.getName() + "," + pd.getKey() + "," + pd.getVersion() );
//		}
		
		// 可以对查询结果进行排序
		//query.orderByProcessDefinitionVersion().desc().listPage(firstResult, maxResults)
		
		// 获取流程定义最新的版本（单一的结果）
		ProcessDefinition pd =
			query.latestVersion().singleResult();
		
		System.out.println( pd.getName() + "," + pd.getKey() + "," + pd.getVersion() );
	}

}
