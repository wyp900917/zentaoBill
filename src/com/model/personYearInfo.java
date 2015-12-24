package com.model;

public class personYearInfo {

	private String account;
	
	private int taskid;
	
	private double consume;
	
	private double tconsume;

	public personYearInfo(String account, double consume, double tconsume) {
		this.account = account;
		this.consume = consume;
		this.tconsume = tconsume;
	}
	
	public personYearInfo(String account, int taskid, double consume,
			double tconsume) {
		this.account = account;
		this.taskid = taskid;
		this.consume = consume;
		this.tconsume = tconsume;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public double getConsume() {
		return consume;
	}

	public void setConsume(double consume) {
		this.consume = consume;
	}

	public double getTconsume() {
		return tconsume;
	}

	public void setTconsume(double tconsume) {
		this.tconsume = tconsume;
	}
}
