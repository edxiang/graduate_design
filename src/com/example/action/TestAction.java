package com.example.action;


import com.example.pojos.Blog;
import com.example.service.BlogService;
import com.opensymphony.xwork2.ActionSupport;

//import net.sf.json.JSONObject;

public class TestAction extends ActionSupport {
	private String root;
	private BlogService blogService;

	public String execute() {
		/*User user = new User();
		user.setId("123");
		user.setName("JSONTest");
		user.setPassword("JSON");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("user", user);
		System.out.println("Userת������ַ���:" + jsonObject.toString());
		root = jsonObject.toString();*/
		Blog blog = blogService.getContent();
		/*
		//get exception in JSONObject;
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("blog", blog);
		System.out.println("Userת������ַ���:" + jsonObject.toString());*/
		
		System.out.println(blog.toString());
		System.out.println("I can get over here");
		
		root = blog.getContent();
		return SUCCESS;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}
	
	public void setBlogService(BlogService blogService){
		this.blogService = blogService;
	}

}