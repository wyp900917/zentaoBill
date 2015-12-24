package com.model;

public class projectConsumeInfo implements Comparable<projectConsumeInfo> {

	private int projectid;
	
	private String account;
	
	private String projectname;
	
	private double consume;
	
	private String longtaskname;
	
	private double taskconsume;
	
	public projectConsumeInfo(int projectid, String projectname, double consume, String longtaskname, double taskconsume) {
		this.projectid = projectid;
		this.projectname = projectname;
		this.consume = consume;
		this.longtaskname = longtaskname;
		this.taskconsume = taskconsume;
	}
	
	public projectConsumeInfo(String account, String projectname, double consume, String longtaskname, double taskconsume) {
		this.account = account;
		this.projectname = projectname;
		this.consume = consume;
		this.longtaskname = longtaskname;
		this.taskconsume = taskconsume;
	}

	public int getProjectid() {
		return projectid;
	}

	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public double getConsume() {
		return consume;
	}

	public void setConsume(double consume) {
		this.consume = consume;
	}

	public String getLongtaskname() {
		return longtaskname;
	}

	public void setLongtaskname(String longtaskname) {
		this.longtaskname = longtaskname;
	}

	public double getTaskconsume() {
		return taskconsume;
	}

	public void setTaskconsume(double taskconsume) {
		this.taskconsume = taskconsume;
	}

	@Override
	public int compareTo(projectConsumeInfo o) {
		if(this.consume < o.consume) {
			return 1;
		} else
			return -1;
	}
}
