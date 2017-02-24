package com.example.dao;

import java.io.Serializable;

import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class BaseDao<T> extends HibernateDaoSupport{
	private final Class<T> clazz;
	
	public BaseDao(Class<T> clazz){
		this.clazz = clazz;
	}
	
	public void save(T t){
		this.getHibernateTemplate().save(t);
	}
	
	public void delete(T t) throws Exception{
		this.getHibernateTemplate().delete(t);
	}
	public void delete(Serializable id){
		T t = (T)this.getHibernateTemplate().get(clazz,id);
		if(t == null)
			throw new DataRetrievalFailureException("Object not found.");
		this.getHibernateTemplate().delete(t);
		
	}
	
	public void update(T t){
		this.getHibernateTemplate().update(t);
	}
	
	
}
