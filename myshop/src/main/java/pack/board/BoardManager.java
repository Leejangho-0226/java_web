package pack.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private int recTot; 	// 전체 레코드 수
	private int pageList = 10; 	// 페이지 당 출력 레코드 수
	private int pageTot; 	// 전체 페이지 수 
	
	
	public BoardManager() {
		try {
			Context context = new InitialContext();
			ds =(DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("Driver 로딩 실패 : " + e.getMessage());
		}
	}
	
	public void totalList() {
		String sql = "select count(*) from board";
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		){
			rs.next();
			recTot = rs.getInt(1);
			System.out.println("전체 레코드 수 : " + recTot);
		} catch (Exception e) {
			System.out.println("totalList err : " + e);
		}
	}
	
	public int getPageSu() { // 총 페이지 수 반환
		pageTot = recTot / pageList;
		if(recTot % pageList > 0) pageTot++;
		System.out.println("전체 페이지 수 : " + recTot);
		return pageTot;
	}
	
	//public ArrayList<BoardDto> getDataAll(int page){ 검색 x 경우
	public ArrayList<BoardDto> getDataAll(int page, String searchType, String searchWord){ // 검색 o 경우
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		//String sql = "select * from board order by gnum desc, onum asc";
		String sql = "select * from board";
		
		try {
			conn = ds.getConnection();
			
			if(searchWord == null) { // 검색 x 경우 
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else {// 검색 o 경우
				sql += " where " + searchType + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+ searchWord + "%");
			}
			
			rs = pstmt.executeQuery();
			
			for(int i = 0; i < (page -1 ) * pageList; i++) {
				rs.next(); // 레코드 포인터 이동
			}
			
			int k = 0;
			while(rs.next() && k < pageList) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
				k++;
			}
			
		} catch (Exception e) {
			System.out.println("getDataAll err : " + e);
		} finally{
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return list; 
	}

	// insert를 위해 num 최대 번호 구하기
	public int currentMaxNum() {
		String sql = "select max(num) from board";
		int num = 0;
		
		try (
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
			){
				if(rs.next()) num = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("currentMaxNum err :" + e);
		}
		return num;
	}
	
	public void saveData(BoardBean bean) {
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
	
		try (
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			pstmt.setInt(9, 0); // readcnt
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, 0);// ounm
			pstmt.setInt(12, 0);// nested
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("saveData err :" + e);
		}
	}
	
	public void updateReadcnt(String num) { // 글 내용 읽기 전에 조회수 증가
		String sql = "update board set readcnt=readcnt + 1 where num=?";
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {	
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err :" + e);
		}
	}
	public BoardDto getData(String num) {
		String sql = "select * from board where num=?";
		BoardDto dto = null;
		
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				
		){
			pstmt.setString(1, num);
			try (ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					dto = new BoardDto();
					dto.setNum(rs.getInt("num"));
					dto.setName(rs.getString("name"));
					dto.setPass(rs.getString("pass"));
					dto.setMail(rs.getString("mail"));
					dto.setTitle(rs.getString("title"));
					dto.setCont(rs.getString("cont"));
					dto.setBip(rs.getString("bip"));
					dto.setBdate(rs.getString("bdate"));
					dto.setReadcnt(rs.getInt("readcnt"));
				}
			}
		} catch (Exception e) {
			System.out.println("getData err :" + e);
		}
		
		return dto;
		
	}
	public BoardDto getReplyData(String num) { // 댓글용
		String sql = "select * from board where num=?";
		BoardDto dto = null;
		
		try (
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				
		){
			pstmt.setString(1, num);
			try (ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					dto = new BoardDto();
					dto.setTitle(rs.getString("title"));
					dto.setGnum(rs.getInt("gnum"));
					dto.setOnum(rs.getInt("onum"));
					dto.setNested(rs.getInt("nested"));
					
					
				}
			}
		} catch (Exception e) {
			System.out.println("getReplyData err : " + e);
		}
		return dto;
		
	}
	
	public void updateOnum(int gnum, int onum) {
	      // 같은 그룹의 레코드는 모두 작업에 참여
	      // 댓글의 onum 은 이미 db 에 있는 onum ㅗ다 크거나 같은 값을 변경한다
	      String sql="update board set onum=onum + 1 where onum >= ? and gnum=?";
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, onum);
	         pstmt.setInt(2, gnum);
	         pstmt.execute();
	      } catch (Exception e) {
	         System.out.println("updateOnum err : " + e.getMessage());
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	         } catch (Exception e2) {
	            
	         }
	      }
	   }
		public void saveReplyData(BoardBean bean) { // 댓글저장
			String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			try (
					Connection conn = ds.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
			){
				pstmt.setInt(1, bean.getNum());
				pstmt.setString(2, bean.getName());
				pstmt.setString(3, bean.getPass());
				pstmt.setString(4, bean.getMail());
				pstmt.setString(5, bean.getTitle());
				pstmt.setString(6, bean.getCont());
				pstmt.setString(7, bean.getBip());
				pstmt.setString(8, bean.getBdate());
				pstmt.setInt(9, 0); // readcnt
				pstmt.setInt(10, bean.getGnum());
				pstmt.setInt(11, bean.getOnum());// ounm
				pstmt.setInt(12, bean.getNested());// nested
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("saveReplyData err :" + e);
			}
		}
		
		public boolean checkPassword(int num, String newPass) {
			boolean b = false;
			String sql = "select pass from board where num=?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(newPass.equals(rs.getString("pass"))) {
						b = true;
					}
				}
			} catch (Exception e) {
				System.out.println("checkPassword err :" + e);
			}finally {
		         try {
			           if(rs != null) rs.close();
			           if(pstmt != null) pstmt.close();
			           if(conn != null) conn.close();
			        } catch (Exception e2) {
			            
			        }
			}
		         return b;
		}
		
		public void saveEdit(BoardBean bean) {
			String sql = "update board set name=?,mail=?,title=?,cont=? where num=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getName());
				pstmt.setString(2, bean.getMail());
				pstmt.setString(3, bean.getTitle());
				pstmt.setString(4, bean.getCont());
				pstmt.setInt(5, bean.getNum());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("saveEdit err :" + e);
			}finally {
		         try {
			           if(rs != null) rs.close();
			           if(pstmt != null) pstmt.close();
			           if(conn != null) conn.close();
			        } catch (Exception e2) {
			            
			        }
			}
		}	
	public void delData(String num) {
		String sql = "delete from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delData err :" + e);
		}finally {
	         try {
		           if(rs != null) rs.close();
		           if(pstmt != null) pstmt.close();
		           if(conn != null) conn.close();
		        } catch (Exception e2) {
		            
		        }
		}
	
	}
}