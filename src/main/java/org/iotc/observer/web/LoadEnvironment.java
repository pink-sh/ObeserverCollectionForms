package org.iotc.observer.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import org.iotc.observer.forms.sql.PersistanceImplementation;
import org.iotc.observer.forms.sql.models.OWork;
import org.iotc.observer.utils.NetUtils;
import org.iotc.observer.utils.Utils;

public class LoadEnvironment {
	
	ServletContext context;
	public LoadEnvironment(ServletContext context) {
		this.context = context;
	}

	public void InitializeContext() {
		PersistanceImplementation persistance = new PersistanceImplementation();
		System.out.println("Checking DB Structure");
		try {
			System.out.println("Wiping out DB...");
			persistance.wipeOut();
		} catch (Exception ex) {
			System.out.println("Cannot wipe out DB!");
		}
		try {
			List<OWork> l1 = persistance.GetOWork();
			System.out.println(l1.size());
		} catch (Exception e) {
			System.out.println("The database seems not initialized...");
			System.out.println("Initializing...");
			Utils utils = new Utils();
			Connection connection = persistance.getConnection();
			PreparedStatement statement;
			try {
				List<String> SQLFile = utils.getFile("org/iotc/observer/sql/prepareDB.sql");
				for (String SQL : SQLFile) {
					if (!SQL.trim().equalsIgnoreCase("")) {
						System.out.println("Running statement: " + SQL);
						statement = connection.prepareStatement(SQL);
						statement.execute();
						connection.commit();
					}
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("Done!");
		
		System.out.println("Initializinig Context...");
		String updateUrl= this.context.getInitParameter("UpdateUrl");
		
		if (NetUtils.isOnline(updateUrl)) {
			System.out.println("Checking for updates...");
			NetUtils.updateSystem(updateUrl, persistance, this.context);
		}
		System.out.println("Done!");
	}
}
