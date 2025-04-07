<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"sangpum":
[
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";
try{
           Class.forName("org.mariadb.jdbc.Driver");
           conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","123");
}catch(Exception e){
           System.out.println("연결 오류:" + e.getMessage());
           return;
}
try{
           pstmt = conn.prepareStatement("select * from sangdata");
           rs = pstmt.executeQuery();
           // 비동기 방식의 이해를 위해 지연 시간 부여
           // Thread.sleep(5000);
           
           while(rs.next()){
                     result += "{";
                     result += "\"code\":" + "\"" + rs.getString("code") + "\",";
                     result += "\"sang\":" + "\"" + rs.getString("sang") + "\",";
                     result += "\"su\":" + "\"" + rs.getString("su") + "\",";
                     result += "\"dan\":" + "\"" + rs.getString("dan") + "\"";
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