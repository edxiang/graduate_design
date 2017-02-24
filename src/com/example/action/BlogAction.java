package com.example.action;

import com.example.pojos.Blog;
import com.example.service.BlogService;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport{
	private String content;
	private Blog blog = new Blog();
	private BlogService blogService;

	public BlogAction() {

	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public BlogService getBlogService() {
		return blogService;
	}

	public void setBlogService(BlogService blogService) {
		this.blogService = blogService;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String execute() {
		System.out.println(content);
		blog.setContent(content);
		blogService.save(blog);
		return "back";
	}

}
