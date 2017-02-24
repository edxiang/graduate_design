package com.example.dao;

import java.util.List;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.example.pojos.User;

public class UserDao extends HibernateDaoSupport {

	public boolean Login(String username, String password) {
		String hql = "from User where username = ? and password = ?";
		List<User> users = (List<User>) getHibernateTemplate().find(hql, username, password);
		if (users == null || users.isEmpty())
			return false;
		return true;
	}

	public void Logup(String username, String password, String phone) {
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setPhone(phone);
		this.getHibernateTemplate().save(u);
	}

	public boolean Check(String username) {
		String hql = "from User where username = ?";
		List<User> users = (List<User>) getHibernateTemplate().find(hql, username);
		if (users == null || users.isEmpty())
			return true;
		else
			return false;
	}

	public boolean getPassword(String username, String phone) {
		String hql = "from User where username = ? and phone = ?";
		List<User> users = (List<User>) getHibernateTemplate().find(hql, username, phone);
		if (users == null || users.isEmpty())
			return false;
		else
			return true;
	}

	public void setPassword(String username, String password) {
		String hql = "from User where username = ?";
		List<User> users = (List<User>) getHibernateTemplate().find(hql, username);
		User u = users.get(0);
		System.out.println(password +" ");
		u.setPassword(password);
		System.out.println(u.getPassword());
		/*
		 * u.setPassword(password); this.getHibernateTemplate().update(u);
		 */
	}

}
