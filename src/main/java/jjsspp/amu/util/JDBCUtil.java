package jjsspp.amu.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");

			// 1. 로컬 테스트용 (Docker MariaDB)
			// "jdbc:mariadb://localhost:3306/디비이름", "유저명", "비밀번호"
			// 보통 Docker MariaDB는 디비이름이 없으면 새로 만들어야 할 수도 있으니 확인 필요.
			// 기본 시스템 DB는 mysql 이지만, 보통 test 데이터베이스 등을 사용.
			// ★ 아래 비밀번호 부분을 본인이 설정한 Docker 비번으로 수정하세요! ★
			conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22200182", "W25_22200182", "jooPh7");

			// 2. Walab 배포용 (학교 과제용) - 배포할 땐 위 주석 처리하고 이걸 풉니다.
			// conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/[본인DB명]", "[본인ID]", "[본인비번]");

		} catch (Exception e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		return conn;
	}

	// 자원 해제 메소드
	public static void close(Connection conn, java.sql.PreparedStatement stmt, java.sql.ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) { e.printStackTrace(); }
	}

	// 자원 해제 메소드 (ResultSet 없을 때)
	public static void close(Connection conn, java.sql.PreparedStatement stmt) {
		try {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) { e.printStackTrace(); }
	}
}

