package com.model;

import java.text.DecimalFormat;

public class storyTypeInfo {

	private String name;
	
	private int count;

	private String value;

	public storyTypeInfo(String name, int count, double value) {
		switch(name.trim()) {
		case "tested":
			this.name = "测试完毕";
			break;
		case "planned":
			this.name = "已计划";
			break;
		case "wait":
			this.name = "等待中";
			break;
		case "developing":
			this.name = "研发中";
			break;
		case "projected":
			this.name = "已验收";
			break;
		case "developed":
			this.name = "研发完毕";
			break;
		case "released":
			this.name = "已发布";
			break;
		case "testing":
			this.name = "测试中";
			break;
		}
		DecimalFormat df = new DecimalFormat("##0");
		this.value = df.format(value);
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
