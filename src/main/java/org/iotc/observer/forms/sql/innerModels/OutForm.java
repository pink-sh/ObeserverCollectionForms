package org.iotc.observer.forms.sql.innerModels;

import java.util.Date;
import java.util.List;

public class OutForm {
	private boolean formFilled;
	private Integer id;
	private String name;
	private String country;
	private String countryIso2;
	private String countryIso3;
	private Date date;
	private Date modify;
	private String sdate;
	private String smodify;
	private List<OutSection> outSection;

	public boolean isFormFilled() {
		return formFilled;
	}

	public void setFormFilled(boolean formFilled) {
		this.formFilled = formFilled;
	}

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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryIso2() {
		return countryIso2;
	}

	public void setCountryIso2(String countryIso2) {
		this.countryIso2 = countryIso2;
	}

	public String getCountryIso3() {
		return countryIso3;
	}

	public void setCountryIso3(String countryIso3) {
		this.countryIso3 = countryIso3;
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

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSmodify() {
		return smodify;
	}

	public void setSmodify(String smodify) {
		this.smodify = smodify;
	}

	public List<OutSection> getOutSection() {
		return outSection;
	}

	public void setOutSection(List<OutSection> outSection) {
		this.outSection = outSection;
	}
}
