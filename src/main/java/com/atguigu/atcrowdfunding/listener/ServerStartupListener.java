package com.atguigu.atcrowdfunding.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServerStartupListener implements ServletContextListener {

	
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	
	public void contextInitialized(ServletContextEvent avt) {
		// 将当前的web应用路径保存到指定的范围中，让所有的用户可以访问
		ServletContext application = avt.getServletContext();
		String path = application.getContextPath();
		
		//在应用范围中保存用户共享的数据
		application.setAttribute("APP_PATH", path);
	}

}
