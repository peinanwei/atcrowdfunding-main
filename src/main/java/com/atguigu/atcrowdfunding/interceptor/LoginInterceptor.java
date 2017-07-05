package com.atguigu.atcrowdfunding.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.util.Const;

/**
 * 适配器模式 ==》 转换器模式
 * LoginInterceptor  ==> HandlerInterceptorAdapter(默认适配器) ==> HandlerInterceptor
 * 
 * 判断当前用户是否登陆
 * 1） 如果没有登陆，那么跳转回到登陆页面
 * 2） 如果已经登陆，让请求继续执行
 * @author 18801
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 获取不需要做登陆拦截路径
		// /test/test.jsp
		String uri = request.getRequestURI();
		//System.out.println( "uri = " + uri );
		
		// 白名单
		List<String> whiteUrls = new ArrayList<String>();
		
		whiteUrls.add("/index.htm");
		whiteUrls.add("/login.htm");
		whiteUrls.add("/dologin.do");
		
		if ( whiteUrls.contains(uri) ) {
			return true;
		} else {
			// 获取当前会话对象
			HttpSession session = request.getSession();
			
			// 从会话对象中获取用户登录信息
			User loginUser = (User)session.getAttribute(Const.LOGIN_USER);
			
			if ( loginUser == null ) {
				// 如果没有登陆，那么跳转回到登陆页面
				response.sendRedirect("/login.htm");
				return false;
			} else {
				// 如果已经登陆，让请求继续执行
				return true;
			}
		}
	}
}
