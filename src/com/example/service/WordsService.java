package com.example.service;

import com.example.dao.WordsDao;

public class WordsService {
	private WordsDao wordsDao;

	public WordsDao getWordsDao() {
		return wordsDao;
	}

	public void setWordsDao(WordsDao wordsDao) {
		this.wordsDao = wordsDao;
	}
	
	public String execute(String username,String choose_words){
		return wordsDao.execute(username, choose_words);
	}
	
	public void update(String username,String choose_words){
		wordsDao.update(username,choose_words);
	}

}
