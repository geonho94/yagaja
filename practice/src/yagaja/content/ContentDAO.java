package yagaja.content;

import java.sql.*;
import java.util.*;

public class ContentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public String getString(String[] strs) {
		String str = "";
		for(int i=0; i<strs.length; i++) {
			str += strs[i];
			if(!(i==strs.length-1)) {
				str +=",";
			}
		}
		return str;
	}
	/** 게시물리스트 조회관련 메서드 */
	public ArrayList<ContentDTO> getList(int page, int list, String city, String gu, String thema){
		try {
			conn = yagaja.db.YagajaDB.getConn();
			
			if(thema.contentEquals("전체")) {
				String citys[] = city.split(",");
				String gus[] = gu.split(",");
				
				String city_con = "";
				String gu_con = "";
				
				for(int i=0; i<citys.length; i++) {
					city_con+="city = ?";
					if(i!=(citys.length-1)) {
						city_con+=" or ";
					}
				}
				for(int i=0; i<gus.length; i++) {
					gu_con+="gu = ?";
					if(i!=(gus.length-1)) {
						gu_con+=" or ";
					}
				}
				String sql = "select * from "
				+ "(select rownum as rnum, a.* from "
				+ "(select idx, subject, image, star,writedate, readnum, reviewnum, likenum, ref from yagaja_content where ("+city_con+") and ("+gu_con+") order by star desc) a) b "
				+ "where rnum >= ? and rnum <= ?";
				int start = (page-1)*list+1;
				int end = page*list;
				ps = conn.prepareStatement(sql);
				int count = 1;
				for(int i=0; i<citys.length; i++) {
					ps.setString(count, citys[i]);
					count++;
				}
				for(int i=0; i<gus.length; i++) {
					ps.setString(count, gus[i]);
					count++;
				}
				ps.setInt(count, start);
				count++;
				ps.setInt(count,end);
				rs = ps.executeQuery();
				rs = ps.executeQuery();
			}else {
				
				String citys[] = city.split(",");
				String gus[] = gu.split(",");
				
				String city_con = "";
				String gu_con = "";
				
				for(int i=0; i<citys.length; i++) {
					city_con+="city = ?";
					if(i!=(citys.length-1)) {
						city_con+=" or ";
					}
				}
				for(int i=0; i<gus.length; i++) {
					gu_con+="gu = ?";
					if(i!=(gus.length-1)) {
						gu_con+=" or ";
					}
				}
				String sql = "select * from "
				+ "(select rownum as rnum, a.* from "
				+ "(select idx, subject, image, star,writedate, readnum, reviewnum, likenum, ref from yagaja_content where ("+city_con+") and ("+gu_con+") and (thema = ?) order by star desc) a) b "
				+ "where rnum >= ? and rnum <= ?";
				int start = (page-1)*list+1;
				int end = page*list;
				ps = conn.prepareStatement(sql);
				int count = 1;
				for(int i=0; i<citys.length; i++) {
					ps.setString(count, citys[i]);
					count++;
				}
				for(int i=0; i<gus.length; i++) {
					ps.setString(count, gus[i]);
					count++;
				}
				ps.setString(count, thema);
				count++;
				ps.setInt(count, start);
				count++;
				ps.setInt(count,end);
				rs = ps.executeQuery();
			}
			
			ArrayList<ContentDTO> al = new ArrayList<ContentDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String subject = rs.getString("subject");
				String image = rs.getString("image");
				double star = rs.getDouble("star");
				String writedate = rs.getString("writedate");
				int readnum = rs.getInt("readnum");
				int reviewnum = rs.getInt("reviewnum");
				int likenum = rs.getInt("likenum");
				int ref = rs.getInt("ref");
				ContentDTO dto = new ContentDTO(idx, subject, image, star, writedate, readnum, reviewnum, likenum, ref);
				al.add(dto);
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
	public int getTotalContent(String city, String gu, String thema) {
		try {
			conn = yagaja.db.YagajaDB.getConn();
			if(thema.contentEquals("전체")) {
				String citys[] = city.split(",");
				String gus[] = gu.split(",");
				
				String city_con = "";
				String gu_con = "";
				
				for(int i=0; i<citys.length; i++) {
					city_con+="city = ?";
					if(i!=(citys.length-1)) {
						city_con+=" or ";
					}
				}
				for(int i=0; i<gus.length; i++) {
					gu_con+="gu = ?";
					if(i!=(gus.length-1)) {
						gu_con+=" or ";
					}
				}
				String sql = "select count(*) from yagaja_content where ("+city_con+") and ("+gu_con+")";
				ps = conn.prepareStatement(sql);
				int count = 1;
				for(int i=0; i<citys.length; i++) {
					ps.setString(count, citys[i]);
					count++;
				}
				for(int i=0; i<gus.length; i++) {
					ps.setString(count, gus[i]);
					count++;
				}
				rs = ps.executeQuery();
			} else {
				String citys[] = city.split(",");
				String gus[] = gu.split(",");
				
				String city_con = "";
				String gu_con = "";
				
				for(int i=0; i<citys.length; i++) {
					city_con+="city = ?";
					if(i!=(citys.length-1)) {
						city_con+=" or ";
					}
				}
				for(int i=0; i<gus.length; i++) {
					gu_con+="gu = ?";
					if(i!=(gus.length-1)) {
						gu_con+=" or ";
					}
				}
				String sql = "select count(*) from yagaja_content where ("+city_con+") and ("+gu_con+") and (thema = ?)";
				ps = conn.prepareStatement(sql);
				int count = 1;
				for(int i=0; i<citys.length; i++) {
					ps.setString(count, citys[i]);
					count++;
				}
				for(int i=0; i<gus.length; i++) {
					ps.setString(count, gus[i]);
					count++;
				}
				ps.setString(count, thema);
				rs = ps.executeQuery();
			}
			
			rs.next();
			int result = rs.getInt(1);

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		
	}
	
	/** 게시물 내용 조회 메서드*/
	public ContentDTO getContent(int idx){
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "select * from yagaja_content where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ContentDTO dto = null;
			if(rs.next()) {
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String image = rs.getString("image");
				String location = rs.getString("location");
				String runningtime = rs.getString("runningtime");
				String tel = rs.getString("tel");
				String city = rs.getString("city");
				String gu = rs.getString("gu");
				String thema = rs.getString("thema");
				double star = rs.getDouble("star");
				String writedate = rs.getString("writedate");
				int readnum = rs.getInt("readnum");
				int reviewnum = rs.getInt("reviewnum");
				int likenum = rs.getInt("likenum");
				int ref = rs.getInt("ref");
				dto = new ContentDTO(idx, subject, content, image, location, runningtime, tel, city, gu, thema, star, writedate, readnum, reviewnum, likenum, ref);
			}
			
			sql = "update yagaja_content set readnum=readnum+1 where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeUpdate();
			
			return dto;
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
