package dselectkey.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class DSelectKeyDAOImpl implements DSelectKeyDAO {

	@Override
	public ArrayList<String> makeSearchList(String searchWordFromAjax) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			conn = DBUtil.getConnection();
			StringBuilder insertMember = new StringBuilder();
			insertMember.append("SELECT DISTINCT AptName FROM housedeal \n");
			insertMember.append("WHERE AptName like ? \n");
			insertMember.append("ORDER BY AptName \n");
			insertMember.append("LIMIT 0, 10");
			pstmt = conn.prepareStatement(insertMember.toString());
			pstmt.setString(1, searchWordFromAjax+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("AptName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return list;
	}//idCheck

}//class
