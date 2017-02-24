package com.example.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WordsToUIAction extends ActionSupport{
	private String result;
	
	public WordsToUIAction(){
		
	}
	
	public String execute(){
		result = (String) ActionContext.getContext().getSession().get("listWords");
		System.out.println("here is wordToUI"+result);
		return "success";
	}
	
	public String getResult(){
		return result;
	}
}
