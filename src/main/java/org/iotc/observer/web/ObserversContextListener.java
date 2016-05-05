package org.iotc.observer.web;

import javax.servlet.ServletContextEvent;

public class ObserversContextListener implements javax.servlet.ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		LoadEnvironment enironment = new LoadEnvironment(arg0.getServletContext());
		enironment.InitializeContext();
	}

}
