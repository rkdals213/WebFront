package aformat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class AFormatDAOImpl implements AFormatDAO {

	@Override
	public int idCheck(String idFromAjax) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int idCount = 0;
		try {
			conn = DBUtil.getConnection();
			StringBuilder insertMember = new StringBuilder();
			insertMember.append("SELECT count(*) cnt FROM ssafy_member2 \n");
			insertMember.append("WHERE userid = ?");
			pstmt = conn.prepareStatement(insertMember.toString());
			pstmt.setString(1, idFromAjax);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idCount = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return idCount;
	}//idCheck

}
