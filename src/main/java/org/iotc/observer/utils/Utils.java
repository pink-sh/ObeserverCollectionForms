package org.iotc.observer.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.iotc.observer.forms.sql.PersistanceImplementation;
import org.iotc.observer.forms.sql.PersistanceInterface;
import org.iotc.observer.forms.sql.innerModels.OutControlledList;
import org.iotc.observer.forms.sql.innerModels.OutField;
import org.iotc.observer.forms.sql.innerModels.OutForm;
import org.iotc.observer.forms.sql.innerModels.OutSection;
import org.iotc.observer.forms.sql.models.ControlledList;
import org.iotc.observer.forms.sql.models.ControlledListMap;
import org.iotc.observer.forms.sql.models.Data;
import org.iotc.observer.forms.sql.models.FormFields;
import org.iotc.observer.forms.sql.models.FormSections;
import org.iotc.observer.forms.sql.models.Forms;

public class Utils {
	
	public Utils() {}
	
	private boolean formFilled;
	
	public List<String> getFile(String fileName) throws IOException {
		ClassLoader classloader1 = Thread.currentThread().getContextClassLoader();
		InputStream is = classloader1.getResourceAsStream(fileName);
		return this.readInputStreamAsString(is);
	}
	
	public List<String> readInputStreamAsString(InputStream inputStream) throws IOException {
		Charset inputCharset = Charset.forName("UTF8");
		BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, inputCharset));
		List<String> responseData = new ArrayList<String>();
		String line;
		while ((line = in.readLine()) != null) {
	        responseData.add(line);
	    }
		return responseData;
	}
	
	public List<OutSection> getFormSections() {
		this.setFormFilled(false);
		PersistanceInterface pi = new PersistanceImplementation();
		List<FormSections> sections = pi.getFormSections();
		List<OutSection> oSections = new ArrayList<OutSection>();
		for (FormSections section : sections) {
			OutSection oSection = new OutSection();
			oSection.setName(section.getName());
			List<FormFields> fields = pi.getFieldsForSection(section.getId());
			List<OutField> oFields = new ArrayList<OutField>();
			for (FormFields field : fields) {
				OutField oField = new OutField();
				oField.setName(field.getName());
				oField.setType(field.getType());
				oField.setValue(null);
				oField.setLabel(field.getLabel());
				oField.setId(field.getId());
				oField.setMandatory(field.isMandatory());
				if (field.getControlledList() != null) {
					ControlledListMap clMap = pi.getControlledListMap(field.getControlledList());
					List<ControlledList> cl = pi.getControlledList(clMap.getCl_name(), clMap.getCl_value(), clMap.getCl_key());
					List<OutControlledList> oClList = new ArrayList<OutControlledList>();
					for (ControlledList clL : cl) {
						OutControlledList oCl = new OutControlledList();
						oCl.setKey(clL.getKey());
						oCl.setValue(clL.getValue());
						oClList.add(oCl);
					}
					oField.setOutControlledList(oClList);
				}
				oFields.add(oField);
			}
			oSection.setOutField(oFields);
			oSections.add(oSection);
		}
		return oSections;
	}
	
	public List<OutSection> getFormSections(Integer formId) {
		return this.getFormSections(formId, true);
	}
	public List<OutSection> getFormSectionsWithoutControlledLists(Integer formId) {
		return this.getFormSections(formId, false);
	}
	
	private List<OutSection> getFormSections(Integer formId, boolean withControlledLists) {
		this.setFormFilled(true);
		PersistanceInterface pi = new PersistanceImplementation();
		List<FormSections> sections = pi.getFormSections();
		List<OutSection> oSections = new ArrayList<OutSection>();
		for (FormSections section : sections) {
			OutSection oSection = new OutSection();
			oSection.setName(section.getName());
			List<FormFields> fields = pi.getFieldsForSection(section.getId());
			List<OutField> oFields = new ArrayList<OutField>();
			for (FormFields field : fields) {
				OutField oField = new OutField();
				oField.setName(field.getName());
				oField.setType(field.getType());
				oField.setMandatory(field.isMandatory());
				Data indata = pi.getDataByFormAndField(formId, field.getId());
				if (indata == null) {
					if (field.isMandatory()) {
						this.setFormFilled(false);
					}
					oField.setValue(null);
				} else {
					if (field.getType().equalsIgnoreCase("checkbox") || field.getType().equalsIgnoreCase("multiple")) {
						String values = (String)indata.getValue();
						List<String> items = new ArrayList<String>();
						for (String t : values.split(";")) {
							items.add(t);
						}
						oField.setValue(items);
					} else {
						oField.setValue(indata.getValue());
					}
				}
				oField.setLabel(field.getLabel());
				oField.setId(field.getId());
				if (field.getControlledList() != null && withControlledLists) {
					ControlledListMap clMap = pi.getControlledListMap(field.getControlledList());
					List<ControlledList> cl = pi.getControlledList(clMap.getCl_name(), clMap.getCl_value(), clMap.getCl_key());
					List<OutControlledList> oClList = new ArrayList<OutControlledList>();
					for (ControlledList clL : cl) {
						OutControlledList oCl = new OutControlledList();
						oCl.setKey(clL.getKey());
						oCl.setValue(clL.getValue());
						oClList.add(oCl);
					}
					oField.setOutControlledList(oClList);
				}
				oFields.add(oField);
			}
			oSection.setOutField(oFields);
			oSections.add(oSection);
		}
		return oSections;
	}
	
	public Forms getFormFromId (Integer formId) {
		PersistanceInterface pi = new PersistanceImplementation();
		return pi.getFormFromId(formId);
	}
	
	
	public void saveData(OutForm data) {
		Integer formId = data.getId();
		PersistanceInterface pi = new PersistanceImplementation();
		pi.deleteFieldsForForm(formId);
		for (OutSection section : data.getOutSection()) {
			String secName = section.getName();
			Integer secId = pi.getFormSectionsFromName(secName).getId();
			for (OutField field : section.getOutField()) {
				if (field.getValue() != null) {
					Data inData = new Data();
					inData.setFieldId(field.getId());
					inData.setFormId(formId);
					inData.setSectionId(secId);
					if (field.getType().equalsIgnoreCase("checkBox") || field.getType().equalsIgnoreCase("multiple")) {
						@SuppressWarnings("unchecked")
						List<String> listOfValues = (List<String>)field.getValue();
						String values = "";
						for (String val : listOfValues) {
							values += val + ";";
						}
						if (values.length() > 0) {
							values = values.substring(0, values.length()-1);
						}
						inData.setValue((Object)values);
					} else {
						inData.setValue((Object)field.getValue());
					}
					pi.insertFormData(inData);
				}
			}
		}
	}
	
	public List<Integer> getListOfMandatoryFieldsId() {
		PersistanceInterface pi = new PersistanceImplementation();
		List<Integer> list = new ArrayList<Integer>();
		List<FormFields> mandatoryFields = pi.getMandatoryFields();
		for (FormFields field : mandatoryFields) {
			list.add(field.getId());
		}
		return list;
	}
	
	public boolean isFormFilled() {
		return formFilled;
	}

	public void setFormFilled(boolean formFilled) {
		this.formFilled = formFilled;
	}
}
