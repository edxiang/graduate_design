package com.example.action;

import com.example.service.*;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private String username;
	private String password;
	private UserService userService;

	private int statement;

	public LoginAction() {

	}

	public String execute() {
		if (userService.Login(username, password)) {
			ActionContext.getContext().getSession().put("username", username);
			statement = 1;
		} else {
			statement = 0;
		}
		return "success";
	}

	public int getStatement() {
		return statement;
	}

/*	public String getUsername() {
		return username;
	}*/

	public void setUsername(String username) {
		this.username = username;
	}

/*	public UserService getUserService() {
		return userService;
	}*/

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

/*	public String getPassword() {
		return password;
	}*/

	public void setPassword(String password) {
		this.password = password;
	}

}
