package com.model;

import java.text.DecimalFormat;

public class taskTypeInfo {

	private String name;

	private String value;

	public taskTypeInfo(String name, double value) {
		switch(name.trim()) {
		case "affair":
			this.name = "�ճ�����";
			break;
		case "cutover":
			this.name = "�л�";
			break;
		case "debug":
			this.name = "����";
			break;
		case "design":
			this.name = "���";
			break;
		case "devel":
			this.name = "����";
			break;
		case "discuss":
			this.name = "����";
			break;
		case "implementation":
			this.name = "ʵʩ";
			break;
		case "manage":
			this.name = "����";
			break;
		case "meeting":
			this.name = "����";
			break;
		case "misc":
			this.name = "����";
			break;
		case "nonworkaffair":
			this.name = "���ճ�����";
			break;
		case "operation":
			this.name = "��ҵ";
			break;
		case "plan":
			this.name = "�ƻ�";
			break;
		case "presale":
			this.name = "��ǰ";
			break;
		case "requirement":
			this.name = "����";
			break;
		case "study":
			this.name = "ѧϰ";
			break;
		case "test":
			this.name = "����";
			break;
		case "training":
			this.name = "��ѵ";
			break;
		case "ui":
			this.name = "����";
			break;
		}
		DecimalFormat df = new DecimalFormat("##0.00");
		this.value = df.format(value);
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

}
