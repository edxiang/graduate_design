package com.example.action;

import com.example.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class GetPasswordAction {
	private String username;
	private String phone;
	private UserService userService;
	private int statement;

	public GetPasswordAction() {

	}

	public String execute() {

		if (userService.getPassword(username, phone)) {
			statement = 1;
			ActionContext.getContext().getSession().put("username", username);
		} else {
			statement = 0;
		}
		return "success";
	}

	public int getStatement() {
		return statement;
	}

	public void setStatement(int statement) {
		this.statement = statement;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
