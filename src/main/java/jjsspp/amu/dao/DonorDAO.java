package jjsspp.amu.dao;

import jjsspp.amu.bean.DonorVO;
import jjsspp.amu.util.JDBCUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonorDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String M_INSERT = "insert into donors (name, age, contact, height, weight, blood_type, smoker, organ, health) values (?,?,?,?,?,?,?,?,?)";
	private final String M_UPDATE = "update donors set name=?, age=?, contact=?, height=?, weight=?, blood_type=?, smoker=?, organ=?, health=? where sid=?";
	private final String M_DELETE = "delete from donors where sid=?";
	private final String M_GET = "select * from donors where sid=?";
	private final String M_LIST = "select * from donors order by sid desc";

	// 1. 추가 (Create)
	public int insertDonor(DonorVO vo) {
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, vo.getName());
			stmt.setInt(2, vo.getAge());
			stmt.setString(3, vo.getContact());
			stmt.setInt(4, vo.getHeight());
			stmt.setInt(5, vo.getWeight());
			stmt.setString(6, vo.getBlood_type());
			stmt.setString(7, vo.getSmoker());
			stmt.setString(8, vo.getOrgan());
			stmt.setString(9, vo.getHealth());
			result = stmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt); }
		return result;
	}

	// 2. 수정 (Update)
	public int updateDonor(DonorVO vo) {
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setInt(2, vo.getAge());
			stmt.setString(3, vo.getContact());
			stmt.setInt(4, vo.getHeight());
			stmt.setInt(5, vo.getWeight());
			stmt.setString(6, vo.getBlood_type());
			stmt.setString(7, vo.getSmoker());
			stmt.setString(8, vo.getOrgan());
			stmt.setString(9, vo.getHealth());
			stmt.setInt(10, vo.getSid()); // WHERE sid=?
			result = stmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt); }
		return result;
	}

	// 3. 삭제 (Delete)
	public void deleteDonor(int sid) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, sid);
			stmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt); }
	}

	// 4. 상세 조회 (Read One)
	public DonorVO getDonor(int sid) {
		DonorVO vo = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo = new DonorVO();
				vo.setSid(rs.getInt("sid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setContact(rs.getString("contact"));
				vo.setHeight(rs.getInt("height"));
				vo.setWeight(rs.getInt("weight"));
				vo.setBlood_type(rs.getString("blood_type"));
				vo.setSmoker(rs.getString("smoker"));
				vo.setOrgan(rs.getString("organ"));
				vo.setHealth(rs.getString("health"));
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt, rs); }
		return vo;
	}

	// 5. 목록 조회 (Read List)
	public List<DonorVO> getDonorList() {
		List<DonorVO> list = new ArrayList<DonorVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				DonorVO vo = new DonorVO();
				vo.setSid(rs.getInt("sid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setContact(rs.getString("contact"));
				vo.setHeight(rs.getInt("height"));
				vo.setWeight(rs.getInt("weight"));
				vo.setBlood_type(rs.getString("blood_type"));
				vo.setSmoker(rs.getString("smoker"));
				vo.setOrgan(rs.getString("organ"));
				vo.setHealth(rs.getString("health"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				list.add(vo);
			}
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt, rs); }
		return list;
	}
	public List<DonorVO> getDonorList(String keyword) {
		List<DonorVO> list = new ArrayList<DonorVO>();
		try {
			conn = JDBCUtil.getConnection();
			// 이름(name)에 검색어가 포함된 사람만 조회
			String sql = "select * from donors where name like ? order by sid desc";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			rs = stmt.executeQuery();
			while (rs.next()) {
				DonorVO vo = new DonorVO();
				vo.setSid(rs.getInt("sid"));
				vo.setName(rs.getString("name"));
				vo.setOrgan(rs.getString("organ"));
				vo.setContact(rs.getString("contact"));
				vo.setBlood_type(rs.getString("blood_type"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				list.add(vo);
			}
		} catch (Exception e) { e.printStackTrace(); }
		finally { JDBCUtil.close(conn, stmt, rs); }
		return list;
	}
}