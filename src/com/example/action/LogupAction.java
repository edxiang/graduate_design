package com.example.action;

import com.example.service.*;
import com.opensymphony.xwork2.ActionContext;

public class LogupAction {
	private String username;
	private String password;
	private String phone;
	private UserService userService;

	public LogupAction() {

	}

	public String execute() {
		userService.Logup(username, password, phone);
		ActionContext.getContext().getSession().put("username", username);
		return "success";
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
