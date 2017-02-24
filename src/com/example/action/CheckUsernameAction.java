package com.example.action;

import com.example.service.UserService;

public class CheckUsernameAction {
	private String username;
	private UserService userService;
	private int statement;

	public CheckUsernameAction() {
		
	}

	public String execute() {
		if (userService.Check(username))
			statement = 1;
		else
			statement = 0;
		System.out.println("in checkUsernameAction");
		return "success";
	}

	public int getStatement() {
		return statement;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
