<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

{"gogeks":
[
<%
request.setCharacterEncoding("utf-8");
String arg = request.getParameter("arg");


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";


try{

	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "123");
}catch(Exception e){
	System.out.println("연결 오류:" + e.getMessage());
	return;

}

try{

	pstmt = conn.prepareStatement("select * from gogek where gogekdamsano=?");
	pstmt.setString(1, arg);
	rs = pstmt.executeQuery();



	while(rs.next()){
		result += "{";
		result += "\"gogekname\":" + "\"" + rs.getString("gogekname") + "\",";
		result += "\"gogektel\":" + "\"" + rs.getString("gogektel") + "\"";
		result += "},";

	}
	if(result.length() > 0){
		result = result.substring(0, result.length() - 1);
	}
	out.print(result);
}catch(Exception e){
	System.out.println("처리 오류:" + e.getMessage());

}
%>
]
}