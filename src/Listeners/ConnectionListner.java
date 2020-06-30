package Listeners;

import javax.servlet.ServletContext;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
@WebListener
public class ConnectionListner implements ServletContextListener {
   Connection connection;
   ServletContext context;
	public ConnectionListner() {
    }
   
    public void contextInitialized(ServletContextEvent sce)  { 
    	context=sce.getServletContext();
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		
    	 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/prog27","root","admin");
    		context.setAttribute("connection", connection);
    	}catch(Exception e)
    	{
    	
    	}
    
    }
    public void contextDestroyed(ServletContextEvent sce)  { 
    	try{
    	context.removeAttribute("connection");
    	connection.close();
    	}catch(Exception e){}
    }
	
}
