package pack.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public OrderManager() {
		try {
			Context context = new InitialContext();
			ds =(DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("OrderManager Driver 로딩 실패 : " + e.getMessage());
		}
	}
	
	public void insertOrder(OrderBean obean) {
		try {
			conn = ds.getConnection();
			String sql = "insert into shop_order(product_no,quantity,sdate,state,id) values(?,?,now(),?,?)";		
		//	System.out.println(obean.getProduct_no() + " " + obean.getQuantity() + " " + 
		//	obean.getState()+ " " + obean.getId());
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, obean.getProduct_no());
			pstmt.setString(2, obean.getQuantity());
			pstmt.setString(3, "1");
			pstmt.setString(4, obean.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertOrder err : " + e);
		}finally {
	        try {
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	        } catch (Exception e2) {
	           
	        }
	   }
	}
	public ArrayList<OrderBean> getOrder(String id){   // 로그인한 고객
	      ArrayList<OrderBean> list = new ArrayList<OrderBean>();
	      
	      try {
	         conn = ds.getConnection();
	         String sql = "select * from shop_order where id=? order by no desc";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            OrderBean orderBean = new OrderBean();
	            orderBean.setNo(rs.getString("no"));
	            orderBean.setProduct_no(rs.getString("product_no"));
	            orderBean.setQuantity(rs.getString("quantity"));
	            orderBean.setSdate(rs.getString("sdate"));
	            orderBean.setState(rs.getString("state"));
	            orderBean.setId(rs.getString("id"));
	            list.add(orderBean);
	         }
	      } catch (Exception e) {
	         System.out.println("getOrder err : " + e);
	      }finally {
	            try {
	                if(rs != null) rs.close();
	                if(pstmt != null)pstmt.close();
	                if(conn != null)conn.close();
	             } catch (Exception e2) {
	                
	             }
	          }
	      return list;
	   }
	
	public ArrayList<OrderBean> getOrderAll(){
		ArrayList<OrderBean> list = new ArrayList<OrderBean>();
	      
	      try {
	         conn = ds.getConnection();
	         String sql = "select * from shop_order order by no desc";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            OrderBean orderBean = new OrderBean();
	            orderBean.setNo(rs.getString("no"));
	            orderBean.setProduct_no(rs.getString("product_no"));
	            orderBean.setQuantity(rs.getString("quantity"));
	            orderBean.setSdate(rs.getString("sdate"));
	            orderBean.setState(rs.getString("state"));
	            orderBean.setId(rs.getString("id"));
	            list.add(orderBean);
	         }
	      } catch (Exception e) {
	         System.out.println("getOrderAll err : " + e);
	      }finally {
	            try {
	                if(rs != null) rs.close();
	                if(pstmt != null)pstmt.close();
	                if(conn != null)conn.close();
	             } catch (Exception e2) {
	                
	             }
	          }
	      return list;
	   }
	
	public OrderBean getOrderDetail(String no) { // 주문 상품 낱개 읽기
		OrderBean bean = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from shop_order where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new OrderBean();
				bean.setNo(rs.getString("no"));
	              bean.setProduct_no(rs.getString("product_no"));
	              bean.setQuantity(rs.getString("quantity"));
	              bean.setSdate(rs.getString("sdate"));
	              bean.setState(rs.getString("state"));
	              bean.setId(rs.getString("id"));

			}
		} catch (Exception e) {
			System.out.println("getOrderDetail err : " + e.getMessage());
		}finally {
            try {
                if(pstmt != null)pstmt.close();
                if(conn != null)conn.close();
             } catch (Exception e2) {
                
             }
          }
		
		return bean;
	}
	
	public boolean updateOrder(String no, String state) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "update shop_order set state=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, no);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateOrder err : " + e.getMessage());
		}finally {
            try {
                if(pstmt != null)pstmt.close();
                if(conn != null)conn.close();
             } catch (Exception e2) {
                
             }
          }
		
		return b;
	}
	
	public boolean deleteOrder(String no) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from shop_order where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteOrder err : " + e.getMessage());
		}finally {
            try {
                if(pstmt != null)pstmt.close();
                if(conn != null)conn.close();
             } catch (Exception e2) {
                
             }
          }
		
		return b;
	}
}
