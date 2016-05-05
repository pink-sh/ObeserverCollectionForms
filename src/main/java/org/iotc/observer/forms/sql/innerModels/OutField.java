package org.iotc.observer.forms.sql.innerModels;

import java.util.List;

public class OutField {
	private Integer id;
	private String name;
	private Object value;
	private String type;
	private String label;
	private boolean mandatory;
	private List<OutControlledList> outControlledList;
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
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public boolean isMandatory() {
		return mandatory;
	}
	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}
	public List<OutControlledList> getOutControlledList() {
		return outControlledList;
	}
	public void setOutControlledList(List<OutControlledList> outControlledList) {
		this.outControlledList = outControlledList;
	}
}
