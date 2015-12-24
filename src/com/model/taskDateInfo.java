package com.model;

public class taskDateInfo implements Comparable<taskDateInfo> {

	private String taskname;
	
	private double consume;
	
	private String startdate;
	
	private String finishdate;
	
	private String status;
	
	public taskDateInfo(String taskname, double consume, String startdate, String finishdate, String status) {
		this.taskname = taskname;
		this.consume = consume;
		this.startdate = startdate;
		this.finishdate = finishdate;
		this.status = status;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public double getConsume() {
		return consume;
	}

	public void setConsume(double consume) {
		this.consume = consume;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public int compareTo(taskDateInfo o) {
		if(this.consume < o.consume)
			return 1;
		else
			return -1;
	}
	
}
