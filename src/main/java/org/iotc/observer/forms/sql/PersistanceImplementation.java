package org.iotc.observer.forms.sql;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
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
import org.iotc.observer.forms.sql.models.Sys;
import org.iotc.observer.forms.sql.models.Tables;
import org.iotc.observer.forms.sql.models.User;

public class PersistanceImplementation implements PersistanceInterface{

	@Override
	public Tables tableCount() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.tableCount();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<OWork> GetOWork() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.GetOWork();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Languages> getLanguages() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getLanguages();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Labels> getLabels(String lang) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getLabels(lang);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void insertUser(User user) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.insertUser(user);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	@Override
	public User selectUser() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.selectUser();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void updateUserLang(String lang) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.updateUserLang(lang);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	@Override
	public Integer insertForm(Forms form) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.insertForm(form);
			return form.getId();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	@Override
	public void wipeOut() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.wipeOut();
		} finally {
			sqlSession.close();
		}
	}
	

	@Override
	public Connection getConnection() {
		return MyBatisSqlSessionFactory.getConnection();
	}

	@Override
	public List<Forms> getForms() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getForms();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<FormSections> getFormSections() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getFormSections();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<FormFields> getFieldsForSection(Integer section) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getFieldsForSection(section);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public ControlledListMap getControlledListMap(String cl_name) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getControlledListMap(cl_name);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<ControlledList> getControlledList(String table, String value, String key) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getControlledList(table, value, key);
		} finally {
			sqlSession.close();
		}
	}
	


	@Override
	public void deleteForm(Integer formId) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.deleteForm(formId);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	@Override
	public void deleteFieldsForForm(Integer formId) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.deleteFieldsForForm(formId);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	@Override
	public FormSections getFormSectionsFromName(String name) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getFormSectionsFromName(name);
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public List<FormFields> getMandatoryFields() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getMandatoryFields();
		} finally {
			sqlSession.close();
		}
	}
	
	@Override
	public List<Data> getFilledMandatoryFields(List<Integer> list, Integer formId){
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getFilledMandatoryFields(list, formId);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void insertFormData(Data data) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.insertFormData(data);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	@Override
	public Data getDataByFormAndField(Integer formId, Integer fieldId) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getDataByFormAndField(formId, fieldId);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Forms getFormFromId(Integer formId) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getFormFromId(formId);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Countries> getCountries() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getCountries();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Countries getCountryById(Integer id) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getCountryById(id);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Countries getCountryByIso2(String iso2) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getCountryByIso2(iso2);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Countries getCountryByIso3(String iso3) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getCountryByIso3(iso3);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Sys getVersion() {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			return mapper.getVersion();
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public void updateVersion(String version) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			PersistanceInterface mapper = sqlSession.getMapper(PersistanceInterface.class);
			mapper.updateVersion(version);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
}
