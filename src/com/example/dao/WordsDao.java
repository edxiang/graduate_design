package com.example.dao;

import java.util.List;
import com.google.gson.*;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.example.pojos.*;

//这里无法使用gson，为什么？？？
public class WordsDao extends HibernateDaoSupport {
	public String execute(String username, String choose_words) {
		Gson gson = new Gson();
		String back = "";
		String hql = "from LearnWords where username = ? and choose_words = ?";

		List<LearnWords> lw = (List<LearnWords>) this.getHibernateTemplate().find(hql, username, choose_words);
		if (lw == null || lw.isEmpty()) {
			LearnWords learnWords = new LearnWords();
			learnWords.setChoose_words(choose_words);
			learnWords.setUsername(username);
			this.getHibernateTemplate().save(learnWords);
			if (choose_words.equals("CET_6")) {
				String hql_cet6 = "from CET_6";
				List<CET_6> cet6 = (List<CET_6>) this.getHibernateTemplate().find(hql_cet6);
				CET_6[] listOfWords = new CET_6[7];
				for (int i = learnWords.getRecord(); i < learnWords.getRecord() + 7; i++) {
					listOfWords[i] = cet6.get(i);
					System.out.println(listOfWords[i].getWord());
				}
				back += gson.toJson(listOfWords);
			} else if (choose_words.equals("CET_4")) {

			} else {
				System.out.println("wrong in words Dao");
			}
		} else {
			LearnWords target = lw.get(0);
			System.out.println(target.getRecord());

			if ((target.getChoose_words()).equals("CET_6")) {
				String hql_cet6 = "from CET_6";
				List<CET_6> cet6 = (List<CET_6>) this.getHibernateTemplate().find(hql_cet6);
				CET_6[] listOfWords = new CET_6[7];
				int j = 0;
				for (int i = target.getRecord(); i < target.getRecord() + 7; i++) {
					listOfWords[j] = cet6.get(i);
					j++;
				}
				back += gson.toJson(listOfWords);
			} else if (choose_words.equals("CET_4")) {

			} else {

			}
		}
		return back;
	}

	public void update(String username, String choose_words) {
		String hql = "from LearnWords where username = ? and choose_words = ?";
		List<LearnWords> lw = (List<LearnWords>) this.getHibernateTemplate().find(hql, username, choose_words);
		LearnWords l = lw.get(0);
		l.setRecord(l.getRecord() + 7);
		this.getHibernateTemplate().update(l);
	}
}
