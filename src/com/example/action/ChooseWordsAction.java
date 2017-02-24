package com.example.action;

import com.example.service.WordsService;
import com.opensymphony.xwork2.ActionContext;

public class ChooseWordsAction {
	private String choose_words;
	private WordsService wordsService;

	public ChooseWordsAction() {

	}

	public String execute() {
		String usernameFromSession = (String) ActionContext.getContext().getSession().get("username");
		ActionContext.getContext().getSession().put("choose_words", choose_words);
		String listWords = wordsService.execute(usernameFromSession, choose_words);
		ActionContext.getContext().getSession().put("listWords", listWords);
		return "success";
	}

	public WordsService getWordsService() {
		return wordsService;
	}

	public void setWordsService(WordsService wordsService) {
		this.wordsService = wordsService;
	}

	public String getChoose_words() {
		return choose_words;
	}

	public void setChoose_words(String choose_words) {
		this.choose_words = choose_words;
	}

}
