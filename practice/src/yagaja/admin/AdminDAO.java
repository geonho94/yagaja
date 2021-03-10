package yagaja.admin;

import java.sql.*;

public class AdminDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final String PATH="C:\\kang\\yagaja\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\yagaja\\admin\\upload";
	
	   public int getMaxref(){
		      try {
		    	 conn = yagaja.db.YagajaDB.getConn();
		         String sql = "select max(ref) from yagaja_content";
		         ps = conn.prepareStatement(sql);
		         rs = ps.executeQuery();
		         int max = 0;
		         if(rs.next()){
		            max = rs.getInt(1);
		         }
		         return max;
		      } catch (Exception e) {
		         e.printStackTrace();
		         return 0;
		      }finally {
		         try {
		            if(rs!=null) {rs.close();}
		            if(ps!=null) {ps.close();}
		            if(conn!=null) {conn.close();}
		         } catch (Exception e2) {
		            // TODO: handle exception
		         }
		      }
		   }
	
	public int ContentAdd(String subject, String content, String image, String location, String runningtime, String tel, String city, String gu, String thema, int ref)
	{
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "insert into yagaja_content values(yagaja_content_idx.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate, 0,0,0,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.setString(3, image);
			ps.setString(4, location);
			ps.setString(5, runningtime);
			ps.setString(6, tel);
			ps.setString(7, city);
			ps.setString(8, gu);
			ps.setString(9, thema);
			ps.setInt(10, ref+1);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	public AdminDTO ContentUpdate_Select(int content_idx)
	{
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "select * from yagaja_content where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, content_idx);
			rs = ps.executeQuery();
			AdminDTO dto = null;
			while(rs.next())
			{
				int idx = rs.getInt("idx");
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
				dto = new AdminDTO(idx, subject, content, image, location, runningtime, tel, city, gu, thema, star, writedate, readnum, reviewnum, likenum, ref);
				}
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int ContentUpdate_file(String image, int ref)
	{
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "update yagaja_content set image = ? where ref = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, image);
			ps.setInt(2, ref);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int ContentUpdate_Update(AdminDTO dto)
	{
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "update yagaja_content set subject = ?, content = ?, location = ?, runningtime = ?, tel = ?, city = ?, gu = ?, thema = ? where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getLocation());
			ps.setString(4, dto.getRunningtime());
			ps.setString(5, dto.getTel());
			ps.setString(6, dto.getCity());
			ps.setString(7, dto.getGu());
			ps.setString(8, dto.getThema());
			ps.setInt(9, dto.getIdx());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int ContentDelete(int idx)
	{
		try {
			conn = yagaja.db.YagajaDB.getConn();
			String sql = "delete from yagaja_content where idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}