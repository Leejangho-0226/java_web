package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbConnGb {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public DbConnGb() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc_maria");

		} catch (Exception e) {
			System.out.println("DbConnGb err : " + e);
		}

	}

	public ArrayList<GuestBookDto> getDataAll() {
		ArrayList<GuestBookDto> list = new ArrayList<GuestBookDto>();
		try {
			conn = ds.getConnection();
			
			String sql = "select * from guestbook";
			pstmt = conn.prepareStatement(sql);
		 	rs = pstmt.executeQuery();
		 	
		 	while(rs.next()) {
		 		GuestBookDto dto = new GuestBookDto();
		 		dto.setCode(rs.getString("code"));
		 		dto.setWriter(rs.getString("writer"));
		 		dto.setTitle(rs.getString("title"));
		 		dto.setContents(rs.getString("contents"));
		 		list.add(dto);
		 	}
			
		} catch (Exception e) {
			System.out.println("err e : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				System.out.println("err e2 : " + e2);
			}
		}

		return list;
	}
	
	
	
	public boolean insertData(GuestBookformbean bn) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			
			String sql = "select max(code) as m from guestbook";
			pstmt = conn.prepareStatement(sql);
		 	rs = pstmt.executeQuery();
		 	int maxCode = 0;
		 	if(rs.next()) {
		 		maxCode = rs.getInt("m");
		 	}
		 	maxCode += 1;
		 	
		 	sql = "insert into guestbook(code,writer,title,contents) values(?,?,?,?)";
		 	pstmt = conn.prepareStatement(sql);
		 	pstmt.setInt(1, maxCode);
		 	pstmt.setString(2, bn.getWriter());
		 	pstmt.setString(3, bn.getTitle());
		 	pstmt.setString(4, bn.getContents());
		 	int result = pstmt.executeUpdate();
		 	
		 	if(result == 1) b = true;
		 	
		} catch (Exception e) {
			System.out.println("insertData err e : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				System.out.println("err e2 : " + e2);
			}
		}
		
		return b;
	}
	
	
	
	public GuestBookDto updateDataRead(String code) {
		GuestBookDto d = null;
		
		String sql = "select * from guestbook where code=?";
		// try - with - resources
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, code);			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				d = new GuestBookDto();
				d.setCode(rs.getString("code"));
				d.setWriter(rs.getString("writer"));
				d.setTitle(rs.getString("title"));
				d.setContents(rs.getString("contents"));

			}
			
		} catch (Exception e) {
			System.out.println("updateDataRRRead err e : " + e);
		}
		
		return d;
	}
	
	public boolean updateData(GuestBookformbean bn) {
		boolean b = false;
		String sql = "update guestbook set writer=?, title=?, contents=? where code=?";
		
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				){
			pstmt.setString(1, bn.getWriter());	
			pstmt.setString(2, bn.getTitle());	
			pstmt.setString(3, bn.getContents());	
			pstmt.setString(4, bn.getCode());	
			
		 	if(pstmt.executeUpdate() > 0) b = true;	 		
		 	
		} catch (Exception e) {
			System.out.println("updateData err e : " + e.getMessage());
		} 
		
		return b;
	}
	
	public boolean deleteData(String code) {
		boolean b = false;
		String sql = "delete from guestbook where code=?";
		
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);	
				){
			pstmt.setString(1, code);		
			
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("deleteData err e : " + e.getMessage());
		}
		
		return b;
	}

}