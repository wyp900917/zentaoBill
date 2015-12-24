package com.model;

public class projectInfo implements Comparable<projectInfo> {

	private int id;
	
	private String name;
	
	private String type;
	
	private String pm;
	
	private String begin;
	
	private String end;
	
	private String team;
	
	private String status;
	
	private double consume;

	public projectInfo(int id, String name, String type, String pm,
			String begin, String end, String team, String status) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.pm = pm;
		this.begin = begin;
		this.end = end;
		this.team = team;
		switch(status) {
		case "doing":
			this.status = "进行中";
			break;
		case "done":
			this.status = "已完成";
			break;
		case "wait":
			this.status = "等待中";
			break;
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getConsume() {
		return consume;
	}

	public void setConsume(double consume) {
		this.consume = consume;
	}

	@Override
	public int compareTo(projectInfo o) {
		if(this.consume < o.consume)
			return 1;
		else
			return -1;
	}

}
