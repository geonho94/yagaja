package yagaja.bbs;

import java.sql.*;
import java.util.*;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/*자유 게시판 리스트 관련메서드 */
	public ArrayList<BbsDTO> contentList(int num_s,int cp,int ls,String key,String value) {

		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql = "";
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			System.out.println(key);
			System.out.println(value);
			if(value.equals("")) {
			 sql="select * from (select rownum as rnum,a.* from (select * from yagaja_bbs where num=? order by idx desc) a) b where rnum>=? and rnum<=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num_s);
			
			ps.setInt(2,start);
			ps.setInt(3,end);
			}else if(key.equals("writer")) {
				sql="select * from (select rownum as rnum,a.* from (select * from yagaja_bbs where num=? and writer=? order by idx desc) a) b where rnum>=? and rnum<=?";
				
				ps=conn.prepareStatement(sql);
				ps.setInt(1, num_s);
				ps.setString(2, value);
				ps.setInt(3,start);
				ps.setInt(4,end);
			}else if(key.equals("subject")) {
				sql="select * from (select rownum as rnum,a.* from (select * from yagaja_bbs where num=? and subject=? order by idx desc) a) b where rnum>=? and rnum<=?";
				
				ps=conn.prepareStatement(sql);
				ps.setInt(1, num_s);
				ps.setString(2, value);
				ps.setInt(3,start);
				ps.setInt(4,end);
			}
			
			rs=ps.executeQuery();
			
			ArrayList<BbsDTO> list= new ArrayList<BbsDTO>();
			BbsDTO dto = null;
			while(rs.next()) {
				int idx= rs.getInt("idx");
				int num= rs.getInt("num");
				String writer= rs.getString("writer");
				String userimg= rs.getString("userimg");
				String subject= rs.getString("subject");
				String content= rs.getString("content");
				String file= rs.getString("file_y");
				java.sql.Date joindate= rs.getDate("joindate");
				String addr= rs.getString("addr");
				int count= rs.getInt("count");
			
				
				dto= new BbsDTO(idx, num, writer,userimg, subject, content, file, joindate, addr, count);
				list.add(dto);
			}
			
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				
			}
		}
	}
	
	/*번개 리스트 관련메서드 */
	public ArrayList<BbsDTO> contentList_l(int num_s,int cp, int ls) {
//		
		try{
			conn=yagaja.db.YagajaDB.getConn();
			//String sql="select * from yagaja_comment where num=? order by ref desc";
			String sql="select * from (select rownum as rnum,a.* from (select * from yagaja_bbs where num=? order by idx desc) a) b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num_s);
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			ps.setInt(2,start);
			ps.setInt(3,end);


			rs=ps.executeQuery();

			ArrayList<BbsDTO> list= new ArrayList<BbsDTO>();
			BbsDTO dto = null;
			while(rs.next()) {
				int idx= rs.getInt("idx");
				int num= rs.getInt("num");
				String writer= rs.getString("writer");
				String userimg= rs.getString("userimg");
				String subject= rs.getString("subject");
				String content= rs.getString("content");
				String file= rs.getString("file_y");
				java.sql.Date joindate= rs.getDate("joindate");
				String addr= rs.getString("addr");
				int count= rs.getInt("count");
				
				
				dto= new BbsDTO(idx, num, writer,userimg, subject, content, file, joindate, addr, count);
				list.add(dto);
			}

			return list;
			}catch(Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {

				}
			}
		}
	
	//w 총게시물수 관련 메서드
			public int getTotalCnt_w(int num,String value) {
				
				try {
					conn=yagaja.db.YagajaDB.getConn();
					String sql="select count(*) from yagaja_bbs where num=? and writer=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, num);
					ps.setNString(2, value);
					rs=ps.executeQuery();
					rs.next();
					int count=rs.getInt(1);
					count=count==0?1:count;
					return count;
				}catch(Exception e) {
					e.printStackTrace();
					return 1;
				}finally {
					try {
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(conn!=null)conn.close();
					}catch(Exception e2) {}
				}
			}
			
			//s 총게시물수 관련 메서드
			public int getTotalCnt_s(int num,String value) {
				
				try {
					conn=yagaja.db.YagajaDB.getConn();
					String sql="select count(*) from yagaja_bbs where num=? and subject=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, num);
					ps.setNString(2, value);
					rs=ps.executeQuery();
					rs.next();
					int count=rs.getInt(1);
					count=count==0?1:count;
					return count;
				}catch(Exception e) {
					e.printStackTrace();
					return 1;
				}finally {
					try {
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(conn!=null)conn.close();
					}catch(Exception e2) {}
				}
			}
	
	/*컨텐츠보기 관련메서드 */
	public BbsDTO bbsContent(int idx_y) {
		
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select * from yagaja_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_y);
			rs=ps.executeQuery();
			
			BbsDTO dto=null;
			if(rs.next()) {
				int idx= rs.getInt("idx");
				int num= rs.getInt("num");
				String writer= rs.getString("writer");
				String userimg= rs.getString("userimg");
				String subject= rs.getString("subject");
				String content= rs.getString("content");
				String file= rs.getString("file_y");
				java.sql.Date joindate= rs.getDate("joindate");
				String addr= rs.getString("addr");
				int count= rs.getInt("count");
				
				
				dto = new BbsDTO(idx, num, writer,userimg, subject, content, file, joindate, addr, count);
				
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
			}catch(Exception e) {
				
			}
		}
	}
	
	/*자유 - 글쓰기 등록관련메서드 */
	public int BbsWrite_bbs(BbsDTO dto) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="insert into yagaja_bbs values(yagaja_bbs_idx.nextval,?,?,?,?,?,?,sysdate,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getNum());;
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getUserimg());
			ps.setString(4, dto.getSubject());
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getFile_y());
			ps.setString(7, dto.getAddr());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
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
	
	/*번개 - 글쓰기 등록관련메서드 */
	public int BbsWrite_lightning(BbsDTO dto) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
//			int max=getMaxRef(); //맥스값을 가져옴 
			String sql="insert into yagaja_bbs values(yagaja_bbs_idx.nextval,?,?,?,0,?,0,sysdate,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getNum());;
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getUserimg());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getAddr());
			
//			ps.setInt(5, max+1);
		
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
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
	
	/*삭제 관련메서드 */
	public int contentDel(int idx) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="delete from yagaja_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null){
					ps.close();
					}
				if(conn!=null){
					conn.close();
					}
			}catch(Exception e2) {
				
			}
		}
	}
	
	/*수정 관련메서드 */
	public int bbsUpdate(BbsDTO dto,int idx) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="update yagaja_bbs set subject=?,content=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setInt(3, idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
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
	
	/*조회수 관련메서드 */
	public int countPlus(int idx) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="update yagaja_bbs set count=count+1 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
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
	
	//총게시물수 관련 메서드
		public int getTotalCnt(int num) {
			
			try {
				conn=yagaja.db.YagajaDB.getConn();
				String sql="select count(*) from yagaja_bbs where num=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, num);
				rs=ps.executeQuery();
				rs.next();
				int count=rs.getInt(1);
				count=count==0?1:count;
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		
		
				
			
				
}
