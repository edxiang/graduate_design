package com.example.pojos;

import java.util.Date;

public class LearnWords {
	private String id;
	private String username;
	private String choose_words;
	private Date date;
	private int record;

	public LearnWords() {
		date = new Date();
		record = 0;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getChoose_words() {
		return choose_words;
	}

	public void setChoose_words(String choose_words) {
		this.choose_words = choose_words;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getRecord() {
		return record;
	}

	public void setRecord(int record) {
		this.record = record;
	}

}
