package cjoinmember.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cjoinmember.dto.SsafyMember2DTO;
import util.DBUtil;

public class CJoinMemberDAOImpl implements CJoinMemberDAO {

	@Override
	public int joinMember(SsafyMember2DTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int successCnt = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into ssafy_member2 \n");
			sql.append("(userid,username,userpwd,telephone,email,address,joindate) \n");
			sql.append("values (?,?,?,?,?,?,now())");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getUserpwd());
			pstmt.setString(4, dto.getTelephone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			successCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return successCnt;
	}

	@Override
	public SsafyMember2DTO login(SsafyMember2DTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select userno,userid,username,telephone,email,address from ssafy_member2 \n");
			sql.append("where userid = ? and userpwd = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpwd());
			rs = pstmt.executeQuery();
			dto = new SsafyMember2DTO();
			if(rs.next()) {
				dto.setUserno(rs.getString("userno"));
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				dto.setTelephone(rs.getString("telephone"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return dto;
	}

}
