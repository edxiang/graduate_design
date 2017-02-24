package com.example.action;

import com.example.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class SetPasswordAction {
	private String password;
	private UserService userService;
	
	public SetPasswordAction(){
		
	}
	
	public String execute(){
		String username = (String) ActionContext.getContext().getSession().get("username");
		userService.setPassword(username,password);
		System.out.println(username +" " + password);
		return "success";
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
