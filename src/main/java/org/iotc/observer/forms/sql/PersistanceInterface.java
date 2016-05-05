package org.iotc.observer.forms.sql;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.iotc.observer.forms.sql.models.ControlledList;
import org.iotc.observer.forms.sql.models.ControlledListMap;
import org.iotc.observer.forms.sql.models.Countries;
import org.iotc.observer.forms.sql.models.Data;
import org.iotc.observer.forms.sql.models.FormFields;
import org.iotc.observer.forms.sql.models.FormSections;
import org.iotc.observer.forms.sql.models.Forms;
import org.iotc.observer.forms.sql.models.Labels;
import org.iotc.observer.forms.sql.models.Languages;
import org.iotc.observer.forms.sql.models.OWork;
import org.iotc.observer.forms.sql.models.Tables;
import org.iotc.observer.forms.sql.models.User;
import org.iotc.observer.forms.sql.models.Sys;

public interface PersistanceInterface {
	Connection getConnection();
	Tables tableCount();
	List<OWork> GetOWork();
	List<Languages> getLanguages();
	List<Labels> getLabels (@Param("lang") String lang);
	User selectUser();
	List<Forms> getForms ();
	void insertUser(User user);
	void updateUserLang(@Param("lang") String lang);
	void insertFormData(Data data);
	Integer insertForm(Forms form);
	void wipeOut();
	
	void deleteForm(@Param("formId") Integer formId);
	void deleteFieldsForForm(@Param("formId") Integer formId);
	
	Data getDataByFormAndField(@Param("formId") Integer formId, @Param("fieldId") Integer fieldId);
	Forms getFormFromId(@Param("formId") Integer formId);
	
	List<Countries> getCountries();
	Countries getCountryById(@Param("id") Integer id);
	Countries getCountryByIso2(@Param("iso2") String iso2);
	Countries getCountryByIso3(@Param("iso3") String iso3);
	
	List<FormSections> getFormSections();
	FormSections getFormSectionsFromName(@Param("name") String name);
	List<FormFields> getFieldsForSection(@Param("section") Integer section);
	
	List<FormFields> getMandatoryFields();
	List<Data> getFilledMandatoryFields(@Param("list") List<Integer> list, @Param("formId") Integer formId);
		
	ControlledListMap getControlledListMap(@Param("cl_name") String cl_name);
	
	List<ControlledList> getControlledList(@Param("table") String table, @Param("value") String value, @Param("key") String key);
	
	Sys getVersion();
	void updateVersion(@Param("version") String version);
}