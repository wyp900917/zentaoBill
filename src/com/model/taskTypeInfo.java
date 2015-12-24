package com.model;

import java.text.DecimalFormat;

public class taskTypeInfo {

	private String name;

	private String value;

	public taskTypeInfo(String name, double value) {
		switch(name.trim()) {
		case "affair":
			this.name = "日常事务";
			break;
		case "cutover":
			this.name = "切换";
			break;
		case "debug":
			this.name = "调试";
			break;
		case "design":
			this.name = "设计";
			break;
		case "devel":
			this.name = "开发";
			break;
		case "discuss":
			this.name = "讨论";
			break;
		case "implementation":
			this.name = "实施";
			break;
		case "manage":
			this.name = "管理";
			break;
		case "meeting":
			this.name = "会议";
			break;
		case "misc":
			this.name = "杂务";
			break;
		case "nonworkaffair":
			this.name = "非日常事务";
			break;
		case "operation":
			this.name = "作业";
			break;
		case "plan":
			this.name = "计划";
			break;
		case "presale":
			this.name = "售前";
			break;
		case "requirement":
			this.name = "需求";
			break;
		case "study":
			this.name = "学习";
			break;
		case "test":
			this.name = "测试";
			break;
		case "training":
			this.name = "培训";
			break;
		case "ui":
			this.name = "界面";
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
