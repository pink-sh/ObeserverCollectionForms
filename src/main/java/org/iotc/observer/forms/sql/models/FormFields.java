package org.iotc.observer.forms.sql.models;

public class FormFields {
	private Integer id;
	private Integer section;
	private String name;
	private String label;
	private String type;
	private String controlledList;
	private boolean mandatory;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSection() {
		return section;
	}
	public void setSection(Integer section) {
		this.section = section;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getControlledList() {
		return controlledList;
	}
	public void setControlledList(String controlledList) {
		this.controlledList = controlledList;
	}
	public boolean isMandatory() {
		return mandatory;
	}
	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}
}
