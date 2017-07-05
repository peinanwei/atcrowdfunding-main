package com.atguigu.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.bean.AJAXResult;
import com.atguigu.atcrowdfunding.common.bean.Member;
import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.user.service.MemberService;
import com.atguigu.atcrowdfunding.user.service.UserService;
import com.atguigu.atcrowdfunding.util.Const;
import com.atguigu.atcrowdfunding.util.MD5Util;

@Controller
public class DispatcherController {

	@Autowired
	private UserService userService;

	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="exit")
	public String exit(HttpSession session ){
		
		session.removeAttribute("loginMember");
		session.removeAttribute("loginUser");
		return "index";
	}
	

	/**
	 * 跳转后台主页面
	 * 
	 * @return
	 */
	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("/member")
	public String member() {
		return "member";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/reg")
	public String reg() {
		return "reg";
	}

	
	/**
	 * 执行会员登录验证
	 * 
	 */
	@ResponseBody
	@RequestMapping("/doMemberlogin")
	public Object doMemberogin(HttpSession session, String loginacct,
			String userpswd, String usertype) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginacct", loginacct);
		map.put("userpswd", MD5Util.digest(userpswd));

		Member member = memberService.queryMember(map);
		AJAXResult result = new AJAXResult();
		if (member == null) {
			result.setSuccess(false);
			result.setErrorMsg("用户不存在或密码不正确");
		} else {
			session.setAttribute(Const.LOGIN_MEMBER, member);
			result.setSuccess(true);
		}
		return result;
	}
	
	/**
	 * 执行登录验证
	 * 
	 */
	@ResponseBody
	@RequestMapping("/dologin")
	public Object dologin(HttpSession session, String loginacct,
			String userpswd, String usertype) {
		AJAXResult result = new AJAXResult();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginacct", loginacct);
		map.put("userpswd", MD5Util.digest(userpswd));

		User user = userService.queryUser(map);
		if (user == null) {
			result.setSuccess(false);
			result.setErrorMsg("用户不存在或密码不正确");
			return result;
		} else {
			session.setAttribute(Const.LOGIN_USER, user);
			List<Permission> permissionsids = userService.getPermissionidsById(user.getId());
			result.setSuccess(true);
			return result;
		}
	}
	/**
	 * 用户注册
	 * @param loginacct
	 * @param userpswd
	 * @param email
	 * @return
	 */
	@RequestMapping("/doreg")
	public String doreg(String loginacct, String userpswd, String email) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginacct", loginacct);
		map.put("userpswd", MD5Util.digest(userpswd));
		map.put("email", email);

		userService.saveUser(map);

		return "member";
	}

}
