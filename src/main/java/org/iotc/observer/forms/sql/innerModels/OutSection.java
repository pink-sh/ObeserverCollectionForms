package org.iotc.observer.forms.sql.innerModels;

import java.util.List;

public class OutSection {
	private String name;
	private List<OutField> outField;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<OutField> getOutField() {
		return outField;
	}

	public void setOutField(List<OutField> outField) {
		this.outField = outField;
	}
}
