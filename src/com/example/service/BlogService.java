package com.example.service;

import com.example.dao.BlogDao;
import com.example.pojos.Blog;

public class BlogService {
	private BlogDao blogDao;

	public BlogDao getBlogDao() {
		return blogDao;
	}

	public void setBlogDao(BlogDao blogDao) {
		this.blogDao = blogDao;
	}

	public void save(Blog blog) {
		blogDao.save(blog);
	}
	public Blog  getContent(){
		return blogDao.getContent();
	}
}
