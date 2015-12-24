package com.model;


public class taskInfo implements Comparable<taskInfo> {

	private int taskid;
	
	private int projectid;
	
	private String taskname;
	
	private String taskmanager;
	
	private double consumed;
	
	private String startdate;
	
	private String finishdate;
	
	private String type;

	public taskInfo(int taskid, int projectid, String taskname,
			String taskmanager, double consumed, String startdate,
			String finishdate, String type) {
		this.taskid = taskid;
		this.projectid = projectid;
		this.taskname = taskname;
		this.taskmanager = taskmanager;
		this.consumed = consumed;
		this.startdate = startdate;
		this.finishdate = finishdate;
		this.type = type;
	}
	
	@Override
	public int compareTo(taskInfo o) {
		return this.startdate.compareTo(o.startdate);
	}

	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public int getProjectid() {
		return projectid;
	}

	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getTaskmanager() {
		return taskmanager;
	}

	public void setTaskmanager(String taskmanager) {
		this.taskmanager = taskmanager;
	}

	public double getConsumed() {
		return consumed;
	}

	public void setConsumed(double consumed) {
		this.consumed = consumed;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getFinishdate() {
		return finishdate;
	}

	public void setFinishdate(String finishdate) {
		this.finishdate = finishdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
