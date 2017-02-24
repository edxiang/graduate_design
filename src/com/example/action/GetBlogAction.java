package com.example.action;

import com.example.dao.BlogDao;
import com.example.pojos.Blog;
import com.example.service.BlogService;
import com.opensymphony.xwork2.ActionSupport;

public class GetBlogAction extends ActionSupport {
	private String content;
	private BlogService blogService;

	public String getContent() {
		content = "over here";
		System.out.println(content + "over get123");
		//content = blogService.getContent();
		System.out.println(content + "over get");
		return content;
	}
	
	public void setContent(){
		content = "whatever!!!";
	}

	public void setBlogService(BlogService blogService) {
		this.blogService = blogService;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String execute() {
		content = "hello, here is content!";
		System.out.println(content);
		return SUCCESS;
	}

}
