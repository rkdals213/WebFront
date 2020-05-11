package eboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import eboard.dto.EBoardDTO;
import util.DBUtil;

public class BoardDAOImpl implements BoardDAO {

	@Override
	public int brdRegist(EBoardDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int successCnt = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into guestbook \n");
			sql.append("(userid,subject,content,regtime) \n");
			sql.append("values (?,?,?,now())");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			successCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return successCnt;
	}//brdRegist

	@Override
	public ArrayList<EBoardDTO> brdList() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EBoardDTO> list = new ArrayList<EBoardDTO>();
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT articleno,userid,subject,content,regtime FROM guestbook \n");
			sql.append("ORDER BY articleno desc \n");
			sql.append("Limit 0, 15 \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EBoardDTO dto = new EBoardDTO();
				dto.setArticleno(rs.getString("articleno"));
				dto.setUserid(rs.getString("userid"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return list;
	}

	@Override
	public EBoardDTO brdDetail(String articleno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EBoardDTO dto = null;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT articleno,userid,subject,content,regtime FROM guestbook \n");
			sql.append("WHERE articleno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, articleno);
			rs = pstmt.executeQuery();
			dto = new EBoardDTO();
			if(rs.next()) {
				dto.setArticleno(rs.getString("articleno"));
				dto.setUserid(rs.getString("userid"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
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

	@Override
	public int brdModify(EBoardDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int successCnt = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update guestbook \n");
			sql.append("set subject = ? \n");
			sql.append(", content = ? \n");
			sql.append("where articleno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getArticleno());
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
	public int brdDelete(String articleno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int successCnt = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from guestbook \n");
			sql.append("where articleno = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, articleno);
			successCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return successCnt;
	}

}//class
