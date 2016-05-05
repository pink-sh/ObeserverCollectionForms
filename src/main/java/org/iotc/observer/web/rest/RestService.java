package org.iotc.observer.web.rest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.iotc.observer.forms.sql.PersistanceImplementation;
import org.iotc.observer.forms.sql.PersistanceInterface;
import org.iotc.observer.forms.sql.innerModels.InForm;
import org.iotc.observer.forms.sql.innerModels.InUser;
import org.iotc.observer.forms.sql.innerModels.OutForm;
import org.iotc.observer.forms.sql.innerModels.OutFormList;
import org.iotc.observer.forms.sql.models.Countries;
import org.iotc.observer.forms.sql.models.Data;
import org.iotc.observer.forms.sql.models.Forms;
import org.iotc.observer.forms.sql.models.Labels;
import org.iotc.observer.forms.sql.models.Languages;
import org.iotc.observer.forms.sql.models.User;
import org.iotc.observer.utils.Utils;
import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.datatype.jsonorg.JsonOrgModule;

@Path("/rest_service")
public class RestService {
	@Path("getLanguages/")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response getLanguages(@QueryParam("lang") String language) throws JSONException {
		JSONObject jsonObject = new JSONObject();
		PersistanceInterface pi = new PersistanceImplementation();
		List<Languages> langs = pi.getLanguages();
		for (Languages lang : langs) {
			if (lang.getCode().toLowerCase().equalsIgnoreCase(language.toLowerCase())) {
				List<Labels> labels = pi.getLabels(lang.getCode());
				for (Labels label : labels) {
					jsonObject.put(label.getName(), label.getVal());
				}
			}
		}
		return Response.status(200).entity(jsonObject.toString()).build();
	}
	
	@Path("insertUser/")
	@POST
	@Produces("application/json;charset=utf-8")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response insertUser(String jsonRequest) throws JSONException {
		JSONObject jsonObject = new JSONObject(jsonRequest);
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		InUser data = mapper.convertValue(jsonObject, InUser.class);
		PersistanceInterface pi = new PersistanceImplementation();
		User user = new User();
		user.setName(data.getName());
		user.setLang(data.getLang().toUpperCase());
		pi.insertUser(user);
		return Response.status(200).build();
	}
	
	/*@Path("updateForm/")
	@POST
	@Produces("application/json;charset=utf-8")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateForm(String jsonRequest) throws JSONException {
		JSONObject jsonObject = new JSONObject(jsonRequest);
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		OutForm data = mapper.convertValue(jsonObject, OutForm.class);
		Utils utils = new Utils();
		try {
			utils.saveData(data);
			return Response.status(200).entity(jsonObject.toString()).build();
		} catch (Exception ex) {
			return Response.status(500).build();
		}
	} */
		
 
	@Path("amILogged/")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response AmILogged() throws JSONException {
		JSONObject jsonObject = new JSONObject();
		PersistanceInterface pi = new PersistanceImplementation();
		User user = pi.selectUser();
		if (user != null) {
			jsonObject.put("LOGGED", "TRUE");
			jsonObject.put("NAME", user.getName());
			jsonObject.put("LANG", user.getLang());
		} else {
			jsonObject.put("LOGGED", "FALSE");
		}
		return Response.status(200).entity(jsonObject.toString()).build();
	}
	
	@Path("updateUserLang/{lang}")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response updateUserLang(@PathParam("lang") String lang) throws JSONException {
		JSONObject jsonObject = new JSONObject();
		PersistanceInterface pi = new PersistanceImplementation();
		pi.updateUserLang(lang.toUpperCase());
		return Response.status(200).entity(jsonObject.toString()).build();
	}
	
	@Path("insertForm/")
	@POST
	@Produces("application/json;charset=utf-8")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response insertForm(String jsonRequest) throws JSONException {
		JSONObject jsonObject = new JSONObject(jsonRequest);
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		InForm data = mapper.convertValue(jsonObject, InForm.class);
		PersistanceInterface pi = new PersistanceImplementation();
		
		Countries country = pi.getCountryById(data.getCountry());
		
		Forms form = new Forms();
		form.setName(data.getName());
		form.setDate(new Date());
		form.setModify(new Date());
		form.setCountry(country.getIso3());
		Integer ID = pi.insertForm(form);
		Utils utils = new Utils();
		OutForm oForm = new OutForm();
		oForm.setId(ID);
		oForm.setName(data.getName());
		oForm.setOutSection(utils.getFormSections());
		oForm.setCountry(country.getNameEn());
		oForm.setCountryIso2(country.getIso2());
		oForm.setCountryIso3(country.getIso3());
		
		mapper = new ObjectMapper();
		
		jsonObject = new JSONObject(oForm);
		try {
			return Response.status(200).entity(mapper.writeValueAsString(oForm)).build();
		} catch (JsonProcessingException e) {
			return Response.status(500).build();
		}
	}
	
	@Path("getForms/")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response getForms(@PathParam("formName") String formName) throws JSONException {
		PersistanceInterface pi = new PersistanceImplementation();
		Utils utils = new Utils();
		User user = pi.selectUser();
		List<Forms> forms = pi.getForms();
		List<OutForm> oForms = new ArrayList<OutForm>();
		List<Integer> idOfMandatoryFields = utils.getListOfMandatoryFieldsId();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		for (Forms form : forms) {
			List<Data> filledMandatoryFields = pi.getFilledMandatoryFields(idOfMandatoryFields, form.getId());
			Countries country = pi.getCountryByIso3(form.getCountry());
			OutForm oForm = new OutForm();
			if (user.getLang().equalsIgnoreCase("EN")) {
				oForm.setCountry(country.getNameEn());
			}
			else if (user.getLang().equalsIgnoreCase("FR")) {
				oForm.setCountry(country.getNameFr());
			}
			else if (user.getLang().equalsIgnoreCase("ES")) {
				oForm.setCountry(country.getNameEs());
			}
			else if (user.getLang().equalsIgnoreCase("AR")) {
				oForm.setCountry(country.getNameAr());
			}
			else if (user.getLang().equalsIgnoreCase("ZH")) {
				oForm.setCountry(country.getNameZh());
			}
			else if (user.getLang().equalsIgnoreCase("RU")) {
				oForm.setCountry(country.getNameRu());
			}
			oForm.setCountryIso2(country.getIso2());
			oForm.setCountryIso3(country.getIso3());
			oForm.setDate(form.getDate());
			oForm.setModify(form.getModify());
			oForm.setSdate(dateFormat.format(form.getDate()));
			oForm.setSmodify(dateFormat.format(form.getModify()));
			oForm.setId(form.getId());
			oForm.setName(form.getName());
			if (filledMandatoryFields.size() == idOfMandatoryFields.size()) {
				oForm.setFormFilled(true);
			} else {
				oForm.setFormFilled(false);
			}
			oForms.add(oForm);
		}
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		OutFormList list = new OutFormList();
		list.setFormList(oForms);
		try {
			return Response.status(200).entity(mapper.writeValueAsString(list)).build();
		} catch (Exception ex) {
			return Response.status(500).build();
		}
		
		/*JSONObject jsonObject = new JSONObject();
		PersistanceInterface pi = new PersistanceImplementation();
		Utils utils = new Utils();
		User user = pi.selectUser();
		List<Forms> forms = pi.getForms();
		Integer i = 0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		List<Integer> idOfMandatoryFields = utils.getListOfMandatoryFieldsId();
		for (Forms form : forms) {
			
			List<Data> filledMandatoryFields = pi.getFilledMandatoryFields(idOfMandatoryFields, form.getId());
			
			Countries country = pi.getCountryByIso3(form.getCountry());
			HashMap<String, String> hash = new HashMap<String, String>();
			hash.put("ID", form.getId().toString());
			hash.put("NAME", form.getName());
			hash.put("DATE", dateFormat.format(form.getDate()));
			hash.put("MODIFY", dateFormat.format(form.getModify()));
			hash.put("COUNTRYISO2", country.getIso2());
			hash.put("COUNTRYISO3", country.getIso3());
			if (filledMandatoryFields.size() == idOfMandatoryFields.size()) {
				hash.put("COMPLETE", "TRUE");
			} else {
				hash.put("COMPLETE", "FALSE");
			}
			if (user.getLang().equalsIgnoreCase("EN")) {
				hash.put("COUNTRY", country.getNameEn());
			}
			else if (user.getLang().equalsIgnoreCase("FR")) {
				hash.put("COUNTRY", country.getNameFr());
			}
			else if (user.getLang().equalsIgnoreCase("ES")) {
				hash.put("COUNTRY", country.getNameEs());
			}
			else if (user.getLang().equalsIgnoreCase("AR")) {
				hash.put("COUNTRY", country.getNameAr());
			}
			else if (user.getLang().equalsIgnoreCase("ZH")) {
				hash.put("COUNTRY", country.getNameZh());
			}
			else if (user.getLang().equalsIgnoreCase("RU")) {
				hash.put("COUNTRY", country.getNameRu());
			}
			jsonObject.put(i.toString(), hash);
			i += 1;
		}
		return Response.status(200).entity(jsonObject.toString()).build();*/
	}
	  
	@Path("updateForm/")
	@POST
	@Produces("application/json;charset=utf-8")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updateForm(String jsonRequest) throws JSONException {
		JSONObject jsonObject = new JSONObject(jsonRequest);
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		OutForm data = mapper.convertValue(jsonObject, OutForm.class);
		Utils utils = new Utils();
		try {
			utils.saveData(data);
			return Response.status(200).entity(jsonObject.toString()).build();
		} catch (Exception ex) {
			return Response.status(500).build();
		}
	}
	
	@Path("getForm/")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response getForm() throws JSONException {
		Utils utils = new Utils();
		OutForm oForm = new OutForm();
		oForm.setOutSection(utils.getFormSections());
		oForm.setFormFilled(utils.isFormFilled());
		JSONObject jsonObject = new JSONObject(oForm);
		return Response.status(200).entity(jsonObject.toString()).build();
	}
	
	@Path("getForm/{formId}")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response getFormFromId(@PathParam("formId") Integer formId) throws JSONException {
		ObjectMapper mapper = new ObjectMapper().registerModule(new JsonOrgModule());
		Utils utils = new Utils();
		OutForm oForm = new OutForm();
		Forms inForm = utils.getFormFromId(formId);
		oForm.setId(inForm.getId());
		oForm.setName(inForm.getName());
		oForm.setOutSection(utils.getFormSections(formId));
		oForm.setFormFilled(utils.isFormFilled());
		try {
			return Response.status(200).entity(mapper.writeValueAsString(oForm)).build();
		} catch (Exception ex) {
			return Response.status(500).build();
		}
	}
	
	@Path("getCountries/")
	@GET
	@Produces("application/json;charset=utf-8")
	public Response getCountries() throws JSONException {
		PersistanceInterface pi = new PersistanceImplementation();
		List<Countries> countries = pi.getCountries();
		ObjectMapper mapper = new ObjectMapper();
		try {
			return Response.status(200).entity(mapper.writeValueAsString(countries)).build();
		} catch (JsonProcessingException e) {
			return Response.status(500).build();
		}
	}
	
	@Path("deleteForm/{formId}")
	@GET
	@Produces(MediaType.TEXT_XML)
	public Response deleteForm(@PathParam("formId") Integer formId) {
		try {
			PersistanceInterface pi = new PersistanceImplementation();
			pi.deleteFieldsForForm(formId);
			pi.deleteForm(formId);
			return Response.status(200).build();
		} catch (Exception ex) {
			return Response.status(500).build();
		}
	}
	
	@Path("export/{formId}")
	@GET
	@Produces(MediaType.TEXT_XML)
	public Response export(@PathParam("formId") Integer formId) {
		PersistanceInterface pi = new PersistanceImplementation();
		Utils utils = new Utils();
		OutForm oForm = new OutForm();
		Forms inForm = utils.getFormFromId(formId);
		oForm.setId(inForm.getId());
		oForm.setName(inForm.getName());
		oForm.setOutSection(utils.getFormSectionsWithoutControlledLists(formId));
		Countries country = pi.getCountryByIso3(inForm.getCountry());
		oForm.setCountry(country.getNameEn());
		oForm.setCountryIso2(country.getIso2());
		oForm.setCountryIso3(country.getIso3());
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String fileName = inForm.getName().replaceAll(" ", "_") + "_" + dateFormat.format(date) + ".xml";
		
		XmlMapper xmlMapper = new XmlMapper();
		try {
			return Response.ok(xmlMapper.writer().with(SerializationFeature.WRAP_ROOT_VALUE).writeValueAsString(oForm), MediaType.APPLICATION_OCTET_STREAM)
            .header("content-disposition", "attachment; filename = " + fileName).build();
		} catch (JsonProcessingException e) {
			return Response.status(500).build();
		}
	}
}
