package yagaja.like;

import java.sql.*;
import java.util.*;

public class LikeDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	
	/**찜 게시물 가져오기 메서드*/
	public ArrayList<String> getLikeList(String userid){
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "select contentidx from yagaja_like where userid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<String> al = new ArrayList<String>();
			while(rs.next()) {
				al.add(rs.getString(1)); // 테이블에서는 넘버 자료형임, 스트링으로 가져와 사용할거임
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}

	/**찜 목록에 추가 및 제거 메서드*/
	public int setLike(String userid, int idx) {
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "insert into yagaja_like values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, idx);
			int count = ps.executeUpdate();
			
			sql = "update yagaja_content set likenum = likenum+1 where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeQuery();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}
	public int delLike(String userid, int idx) {
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "delete from yagaja_like where userid = ? and contentidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, idx);
			int count = ps.executeUpdate();
			
			sql = "update yagaja_content set likenum = likenum-1 where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeQuery();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
}
