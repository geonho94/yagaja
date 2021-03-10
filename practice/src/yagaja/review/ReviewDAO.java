package yagaja.review;

import java.sql.*;
import java.util.*;

import yagaja.content.ContentDTO;

public class ReviewDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	/**리뷰 작성 메서드*/
	public int writeReview(ReviewDTO dto) {
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "insert into values(yagaja_review_idx.nextval, ?, ?, ?, ?, sysdate, ?, 0, 0, 0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getContentidx());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getImage());
			ps.setInt(5, dto.getStar());
			int count = ps.executeUpdate();
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
	/**리뷰 조회 메서드*/
	public ArrayList<ReviewDTO> getReview(int contentidx){
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "select * from yagaja_review where contentidx = ? order by star";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, contentidx);
			rs = ps.executeQuery();
			ArrayList<ReviewDTO> al = new ArrayList<ReviewDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String content = rs.getString("content");
				String image = rs.getString("image");
				String writedate = rs.getString("writedate");
				int star = rs.getInt("star");
				int commentnum = rs.getInt("commentnum");
				int likenum = rs.getInt("likenum");
				int ref = rs.getInt("ref");
				ReviewDTO temp = new ReviewDTO(idx, contentidx, id, content, image, writedate, star, commentnum, likenum, ref);
				al.add(temp);
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
	
}
