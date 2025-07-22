package com.User;

import java.util.Date;
//import java.util.Date;

public class Post {
	private int id;
	private String title;
	private String contnent;
	private Date pdate;
	private UserDetails user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContnent() {
		return contnent;
	}
	public void setContnent(String contnent) {
		this.contnent = contnent;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public UserDetails getUser() {
		return user;
	}
	public void setUser(UserDetails user) {
		this.user = user;
	}
	public Post(int id, String title, String contnent, Date pdate, UserDetails user) {
		super();
		this.id = id;
		this.title = title;
		this.contnent = contnent;
		this.pdate = pdate;
		this.user = user;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
}
