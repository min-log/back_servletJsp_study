package email;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class EmaillistDao {
	
	public Connection getConnection() throws SQLException {
		Connection conn= null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dburl,"webDB","1234");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("JDBC 연결실패!");
		}
		System.out.println("JDBC 연결성공!");
		return conn;
	}

	
	public int insert(EmailVo vo) {
		int count = -1;
		Connection conn = null;
		PreparedStatement pstat= null;
		
		try {
			conn = getConnection();
			String sql="INSERT INTO EMAILLIST VALUES (seq_emaillist_no.nextval, ?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, vo.getLast_name());
			pstat.setString(2, vo.getFirst_name());
			pstat.setString(3, vo.getEmail());
			count = pstat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("JDBC 저장 성공!");
		return count;
		
	}
	
	
	
	
	public ArrayList<EmailVo> getlist() {
		
		ArrayList<EmailVo> emaillist = new ArrayList<EmailVo>();
		Connection conn= null;
		ResultSet rs = null;
		PreparedStatement pstat = null;
		String qury = "SELECT no,last_name,first_name,email\r\n" + 
				"FROM emaillist";
		
		try {
			
			conn = getConnection();
			pstat = conn.prepareStatement(qury);
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				emaillist.add(new EmailVo(rs.getString("last_name"), rs.getString("first_name"), rs.getString("email")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("리스트 전체 객체 넣기");
		return emaillist;
		
	}

}
