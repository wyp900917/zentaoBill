package com.model;

import java.text.DecimalFormat;

public class storyTypeInfo {

	private String name;
	
	private int count;

	private String value;

	public storyTypeInfo(String name, int count, double value) {
		switch(name.trim()) {
		case "tested":
			this.name = "�������";
			break;
		case "planned":
			this.name = "�Ѽƻ�";
			break;
		case "wait":
			this.name = "�ȴ���";
			break;
		case "developing":
			this.name = "�з���";
			break;
		case "projected":
			this.name = "������";
			break;
		case "developed":
			this.name = "�з����";
			break;
		case "released":
			this.name = "�ѷ���";
			break;
		case "testing":
			this.name = "������";
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
