package guestbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestBookDaoImpl implements GuestBookDao {
	public GuestBookDaoImpl(){}
	private Connection getConnection() throws SQLException{
		// jdbc연결
		Connection conn= null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dburl, "webDB", "1234");
			System.out.println("jdbc 연결 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("jdbc 연결 실패");
		}
		
		
		return conn;
	}
	@Override
	public ArrayList<GuestBookVo> getlist() {
		// 리스트 출력
		ArrayList<GuestBookVo> list = new ArrayList<GuestBookVo>();
		Connection conn = null;
		String qury = "SELECT * FROM guestbook";
		PreparedStatement pstat=null;
		ResultSet rs =null;
		try {
			conn = getConnection();
			pstat= conn.prepareStatement(qury);
			rs = pstat.executeQuery();
			while(rs.next()) {
				GuestBookVo vo = new GuestBookVo(rs.getString("no"),rs.getString("name"), rs.getString("password"), rs.getString("content"), rs.getString("req_date"));
				list.add(vo);
			}
			System.out.println("리스트 전달완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("jdbc 종료 오류");
			}
			
		}
		
		
		return list;
	}

	@Override
	public int insert(GuestBookVo vo) {
		// 저장
		System.out.println(vo);
		int count = -1; 
		Connection conn = null;
		String qury ="INSERT INTO guestbook VALUES (seq_guestbook.nextval,?,?,?,sysdate)";
		
		PreparedStatement pstat = null;
		try {
			conn = getConnection();
			pstat = conn.prepareStatement(qury);
			pstat.setString(1, vo.getName());
			pstat.setString(2, vo.getPassword());
			pstat.setString(3, vo.getContent());
			count = pstat.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("데이터 저장실패");
		} finally {
			try {
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("jdbc 종료 오류");
			}
			
		}
	
		
		System.out.println("데이터 저장성공");
		return count;
	}

	@Override
	public int delete(GuestBookVo vo) {
		int count = 0; 
		Connection conn = null;
		PreparedStatement pstat = null;
		System.out.println(vo);
		String qury ="DELETE guestbook\r\n" + 
				"WHERE password = ?";
		
		try {
			conn = getConnection();
			pstat = conn.prepareStatement(qury);
			pstat.setString(1, vo.getPassword());
			count = pstat.executeUpdate();
			System.out.println("데이터 삭제성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("jdbc 종료 오류");
			}
		}
		
		
		return count;
	}

	@Override
	public int update(GuestBookVo vo) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstat = null;
		
		String qury = "UPDATE guestbook SET NAME =?, CONTENT=? WHERE password = ? and no = ?";
		
		try {
			conn = getConnection();
			pstat = conn.prepareStatement(qury);
			pstat.setString(1, vo.getName());
			pstat.setString(2, vo.getContent());
			pstat.setString(3, vo.getPassword());
			pstat.setString(4, vo.getNo());
			count = pstat.executeUpdate();
			
			System.out.println("데이터 수정 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("jdbc 종료 오류");
			}
		}
		
		
		return count;
	}
	
	
	public ArrayList<GuestBookVo> search(GuestBookVo vo) {
		int count = 0; 
		ArrayList<GuestBookVo> list = new ArrayList<GuestBookVo>();
		
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String qury ="SELECT * FROM guestbook WHERE NO = ?";
		
		try {
			conn = getConnection();
			pstat = conn.prepareStatement(qury);
			pstat.setString(1, vo.getNo());
			rs = pstat.executeQuery();
			while (rs.next()) {
				GuestBookVo item = new GuestBookVo(rs.getString("no"),rs.getString("name"), rs.getString("password"), rs.getString("content"), rs.getString("req_date"));
				list.add(item);
			}
			System.out.println("데이터 확인완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstat.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("jdbc 종료 오류");
			}
		}
		
		
		return list;
	}

}
