<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Enumeration params = request.getParameterNames();
	while(params.hasMoreElements()){
		String name = (String) params.nextElement();
		out.print(name +":"+ request.getParameter(name) + "<br />");
		
	}
	
	
%>