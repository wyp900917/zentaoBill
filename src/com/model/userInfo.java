package com.model;

public class userInfo {

	private String account;
	
	private String realname;
	
	private String role;
	
	public userInfo(String account, String realname) {
		this.account = account;
		this.realname = realname;
	}

	public userInfo(String account, String realname, String role) {
		this.account = account;
		this.realname = realname;
		this.role = role;
	}
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
