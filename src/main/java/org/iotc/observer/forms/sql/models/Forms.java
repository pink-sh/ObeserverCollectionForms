package org.iotc.observer.forms.sql.models;

import java.util.Date;

public class Forms {
	private Integer id;
	private String name;
	private Date date;
	private Date modify;
	private String Country;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getModify() {
		return modify;
	}
	public void setModify(Date modify) {
		this.modify = modify;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
}
