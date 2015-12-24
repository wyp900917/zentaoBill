package com.model;

public class projectYearInfo {

	private int id;
	
	private double consume;
	

	public projectYearInfo(int id, double consume) {
		this.id = id;
		this.consume = consume;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getConsume() {
		return consume;
	}

	public void setConsume(double consume) {
		this.consume = consume;
	}
}
