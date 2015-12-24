package com.model;

public class productInfo {

	private int id;
	
	private String name;
	
	private String status;
	
	private String po;
	
	private String qd;
	
	private String rd;
	
	private String createby;
	
	private String createdate;
	
	private int deleted;

	public productInfo(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public productInfo(int id, String name, String po, String status, String startdate) {
		this.id = id;
		this.name = name;
		this.po = po;
		this.createdate = startdate;
		switch(status) {
		case "normal":
			this.status = "Õý³£";
			break;
		case "closed":
			this.status = "¹Ø±Õ";
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPo() {
		return po;
	}

	public void setPo(String po) {
		this.po = po;
	}

	public String getQd() {
		return qd;
	}

	public void setQd(String qd) {
		this.qd = qd;
	}

	public String getRd() {
		return rd;
	}

	public void setRd(String rd) {
		this.rd = rd;
	}

	public String getCreateby() {
		return createby;
	}

	public void setCreateby(String createby) {
		this.createby = createby;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
}
