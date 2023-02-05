<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%
	//String saveFolder = "C:/Jsp/myapp/WebContent/ch13/filestorage";
  	String saveFolder = "C:/java_work/java_fast/ko_ServleJsp/WebContent/source/ch13/filestorage"; //파일저장경로
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024; // 파일 최대 크기 5MByte
	try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, maxSize,
		encType, new DefaultFileRenamePolicy()); // new DefaultFileRenamePolicy() 같은 명의 파일이 있다면 이름을 적절하게 변경하여 올려주는 역할 (ex:뒤에 번호 추가로 붙음)
		Enumeration params = multi.getParameterNames();// user, title을 얻기 위해

		while (params.hasMoreElements()) { //가지고 있는게 더 있는지 확인
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br/>");
		}

		Enumeration files = multi.getFileNames(); //파일을 여러개 올릴경우getFileNames 
		while (files.hasMoreElements()) { 
			String name = (String) files.nextElement(); //객체 안에 파일을 받기 위한 이름
			String filename = multi.getFilesystemName(name); //DefaultFileRenamePolicy 클래스의 파일 정책에 의해서 변경된 파일명
			String original = multi.getOriginalFileName(name); // 사용자가 올린 파일명칭
			String type = multi.getContentType(name); // 파일 데이터 타입 MultipartRequest
			File f = multi.getFile(name); // 실제 파일 데이터 
			out.println("파라미터 이름 : " + name + "<br/>");
			out.println("실제 파일 이름 : " + original + "<br/>");
			out.println("저장된 파일 이름 : " + filename + "<br/>");
			out.println("파일 타입 : " + type + "<br/>");
			if (f != null) {
				out.println("크기 : " + f.length()+"바이트");
				out.println("<br/>");
			}
		}
		//파일이 저장이 안될때
	} catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
	}
%>