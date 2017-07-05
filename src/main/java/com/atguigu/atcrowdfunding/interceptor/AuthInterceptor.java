package com.atguigu.atcrowdfunding.interceptor;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.atguigu.atcrowdfunding.util.Const;

/**
 * 权限拦截器
 * 对用户发送的请求进行权限的控制
 * 1) 如果用户的请求路径在合法的权限路径中，那么请求继续执行
 * 2） 如果用户的请求路径不在合法的权限路径中，那么需要跳转到错误页面
 * @author 18801
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//System.out.println("AuthInterceptor preHandle...");
		
		// 获取当前用户的请求路径uri
		String uri = request.getRequestURI();

		// 从应用对象中获取系统中需要进行权限控制的路径集合
		ServletContext application = request.getSession().getServletContext();
		Set<String> uriSet = (Set<String>)application.getAttribute("uriSet");
		
		/*
		List<Permission> permissions = permissionService.queryAll();
		Set<String> uriSet = new HashSet<String>();
		for ( Permission permission : permissions ) {
			if ( StringUtil.isNotEmpty(permission.getUrl()) ) {
				uriSet.add("/" + permission.getUrl());
			}
		}
		*/
		
		if ( uriSet.contains(uri) ) {
			// 权限控制
			HttpSession session = request.getSession();
			Set<String> authUris = (Set<String>)session.getAttribute(Const.AUTH_URIS);
			
			if ( authUris.contains(uri) ) {
				// 合法访问
				return true;
			} else {
				// 非法访问
				response.sendRedirect("/error.htm");
				return false;
			}
		} else {
			return true;
		}
	}
}
