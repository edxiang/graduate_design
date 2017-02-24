package com.example.action;

import com.example.service.WordsService;
import com.opensymphony.xwork2.ActionContext;

public class UpdateRecordAction {
	private WordsService wordsService;

	public UpdateRecordAction() {

	}

	public String execute() {
		String username = (String) ActionContext.getContext().getSession().get("username");
		String choose_words = (String) ActionContext.getContext().getSession().get("choose_words");
		wordsService.update(username, choose_words);
		return "success";
	}

	public void setWordsService(WordsService wordsService) {
		this.wordsService = wordsService;
	}

}
