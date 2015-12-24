package com.model;

public class taskConsumedInfo implements Comparable<taskConsumedInfo> {

	private String taskname;
	
	private double consume;
	
	public taskConsumedInfo(String taskname, double consume) {
		this.taskname = taskname;
		this.consume = consume;
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

	@Override
	public int compareTo(taskConsumedInfo t) {
		if(this.consume < t.consume) {
			return 1;
		}else
			return -1;
	}
}
