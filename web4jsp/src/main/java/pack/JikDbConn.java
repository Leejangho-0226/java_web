package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JikDbConn { // DB 처리용 Business Logic

	private Connection connection;
    private PreparedStatement prestatement;
    private ResultSet resultset;
    private String bname;
    
    private int minPay;
    private int maxPay;

    public String getBname() { return bname; }
    public void setBname(String bname) { this.bname = bname; }
    public int getMinPay() { return minPay; }
    public void setMinPay(int minPay) { this.minPay = minPay; }
    public int getMaxPay() { return maxPay; }
    public void setMaxPay(int maxPay) { this.maxPay = maxPay; }

    public JikDbConn() {
        try { 
        Class.forName("org.mariadb.jdbc.Driver");
        } catch (Exception e) {
          System.out.println("class err : " + e.getMessage());
        }
    }

    public ArrayList<JikwonDto> getDataAll() {
        ArrayList<JikwonDto> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "123");
                PreparedStatement pstmt = conn.prepareStatement("SELECT jikwonno, jikwonname, jikwonjik, jikwongen FROM jikwon INNER JOIN buser ON buserno = busernum WHERE busername=?")) {
               pstmt.setString(1, bname);
               try (ResultSet rs = pstmt.executeQuery()) {
                   while (rs.next()) {
                       JikwonDto dto = new JikwonDto();
                       dto.setNo(rs.getString("jikwonno"));
                       dto.setName(rs.getString("jikwonname"));
                       dto.setJik(rs.getString("jikwonjik"));
                       dto.setGen(rs.getString("jikwongen"));
                       list.add(dto);
                   }
               }
        } catch (Exception e) {
            System.out.println("getDataAll err : " + e.getMessage());
        } finally {
            try {
                if (resultset != null) resultset.close();
                if (prestatement != null) prestatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                System.out.println("getDataAll err : " + e.getMessage());
            }
        }
        return list;
    }
    
    public void getJikPay() {
    	  try (Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "123");
    	             PreparedStatement pstmt = conn.prepareStatement("SELECT MIN(jikwonpay) AS minPay, MAX(jikwonpay) AS maxPay FROM jikwon INNER JOIN buser ON buserno = busernum WHERE busername=?")) {
    	            pstmt.setString(1, bname);
    	            try (ResultSet rs = pstmt.executeQuery()) {
    	                if (rs.next()) {
    	                    setMinPay(rs.getInt("minPay"));
    	                    setMaxPay(rs.getInt("maxPay"));
    	                }
    	            } 	            
        } catch (Exception e) {
            System.out.println("getPayRange err : " + e.getMessage());
        }
    }
}
