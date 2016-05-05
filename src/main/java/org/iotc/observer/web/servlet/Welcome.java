package org.iotc.observer.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Welcome extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5325131026986137913L;

	public void init() throws ServletException {
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.getSession().setAttribute("Welcome", "HELLO Buddy!");
		RequestDispatcher view=getServletContext().getRequestDispatcher("/load.jsp");
		view.forward(request, response);
		
	}
}
