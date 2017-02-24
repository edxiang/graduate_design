package com.example.service;


import com.example.dao.UserDao;
import com.example.pojos.User;

public class UserService {

	private UserDao userDao;

	public boolean Login(String username, String password) {
		return userDao.Login(username, password);
	}
	
	public void Logup(String username, String password,String phone){
		userDao.Logup(username, password,phone);
	}
	
	public boolean Check(String username){
		return userDao.Check(username);
	}
	
	public boolean getPassword(String username, String phone){
		return userDao.getPassword(username,phone);
	}
	
	public void setPassword(String username,String password){
		userDao.setPassword(username,password);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
