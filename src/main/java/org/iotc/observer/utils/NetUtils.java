package org.iotc.observer.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import org.iotc.observer.forms.sql.PersistanceImplementation;
import org.iotc.observer.utils.remote.File;
import org.iotc.observer.utils.remote.Version;
import org.iotc.observer.utils.remote.Versions;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.FileWriter;

public class NetUtils {
	
	private static int timeoutMs = 4000;
	
	public static boolean isOnline(String url) {
		try {
			URL myTestingUrl = new URL(url);
			URLConnection conn = myTestingUrl.openConnection();  
			conn.setConnectTimeout(timeoutMs);  
			conn.setReadTimeout(timeoutMs);  
			conn.getInputStream();
		} catch (IOException ex) {
			return false;
		}
		return true;
	}
	
	public static boolean updateSystem(String url, PersistanceImplementation pi, ServletContext context) {
		try {
			SystemVersion currSysVer = new SystemVersion(pi.getVersion().getVersion());
			ObjectMapper mapper = new ObjectMapper();
			Utils utils = new Utils();
			Versions versions = mapper.readValue(new URL(url), Versions.class);
			for (Version version : versions.getVersions()) {
				SystemVersion updSysVer = new SystemVersion(version.getVersion());
				if (updSysVer.compareTo(currSysVer) > 0) {
					System.out.println("Updating...");
					for (File file : version.getFiles()) {
						if (file.getType().equalsIgnoreCase("sql")) {
							URL sqlUrl = new URL(file.getFile());
							InputStream is = sqlUrl.openStream();
							Connection connection = pi.getConnection();
							PreparedStatement statement;
							List<String> SQLFile = utils.readInputStreamAsString(is);
							for (String SQL : SQLFile) {
								if (!SQL.trim().equalsIgnoreCase("")) {
									System.out.println("Running statement: " + SQL);
									statement = connection.prepareStatement(SQL);
									statement.execute();
									connection.commit();
								}
							}
						}
						else if (file.getType().equalsIgnoreCase("web")) {
							String absoluteDiskPath = context.getRealPath(file.getDest());
							System.out.println(absoluteDiskPath);
							if (! new java.io.File(absoluteDiskPath).exists()) {
								new java.io.File(absoluteDiskPath).mkdirs();
							}
							String localUpdateFile = absoluteDiskPath + file.getFile().split("/")[file.getFile().split("/").length - 1];
							if (new java.io.File(localUpdateFile).exists()) {
								new java.io.File(localUpdateFile).delete();
							}
							URL webUrl = new URL(file.getFile());
							List<String> remoteFile = utils.readInputStreamAsString(webUrl.openStream());
							FileWriter writer = new FileWriter(localUpdateFile); 
							for(String str: remoteFile) {
							  writer.write(str);
							}
							writer.close();
						}
					}
					pi.updateVersion(version.getVersion());
				}
			}
		} catch (JsonParseException e) {
			e.printStackTrace();
			return false;
		} catch (JsonMappingException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e1) {
			e1.printStackTrace();
			return false;
		} finally {
			System.out.println("System updated!");
		}
		return true;
	}
}
