package com.banshou.app.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bs_requests")
public class Request {

	@Id
	@Column(name = "r_number", nullable = false)
	private String number;

	@Column(name = "r_category", nullable = true)
	private String category;

	@Column(name = "r_mobile", nullable = true)
	private String mobile;

	@Column(name = "r_createtime", nullable = true)
	private Date time;

	@Column(name = "r_status", nullable = true)
	private String status;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
