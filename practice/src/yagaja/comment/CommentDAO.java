package yagaja.comment;

import java.sql.*;
import java.util.ArrayList;

import yagaja.bbs.BbsDTO;

public class CommentDAO {

	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/*게시판 리스트 관련메서드 */
	public ArrayList<CommentDTO> commenttList(int num_s) {
//										
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select * from yagaja_comment where num=? order by ref desc";
//			String sql="select * from " + 
//					"(select rownum as rnum,a.* from " + 
//					"(select * from yagaja_comment where num=? order by ref desc,sunbun asc) a) b " + 
//					"where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num_s);
//			int start=(cp-1)*ls+1;
//			int end=cp*ls;
//			ps.setInt(2,start);
//			ps.setInt(3,end);
			rs=ps.executeQuery();
			
			ArrayList<CommentDTO> list= new ArrayList<CommentDTO>();
			CommentDTO dto = null;
			while(rs.next()) {
				int idx= rs.getInt("idx");
				int num= rs.getInt("num");
				String writer= rs.getString("writer");
				String userimg= rs.getString("userimg");
				String content= rs.getString("content");
				String addr= rs.getString("addr");
				java.sql.Date writedate= rs.getDate("writedate");
				int ref= rs.getInt("ref");
				int lev= rs.getInt("lev");
				
				dto= new CommentDTO(idx, num, writer, userimg, addr, content, writedate, ref, lev);
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
	
	/*댓글작성 관련메서드 */
	public int commentAdd(CommentDTO dto) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			int max=getMaxRef(); //맥스값을 가져옴 
			String sql="insert into yagaja_comment values(?,?,?,?,?,?,sysdate,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());
			ps.setInt(2, dto.getNum());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getUserimg());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getContent());
			ps.setInt(7, max+1);
		
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
	
	/*대 댓글작성 관련메서드 */
	public int comment_comment_Add(CommentDTO dto) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			int max=getMaxLev(); //맥스값을 가져옴 
//			String sql="insert into jsp_guest values(jsp_guest_idx.nextval,?,?,?,sysdate,0,?,0,0)";
			String sql="insert into yagaja_comment values(?,?,?,?,?,?,sysdate,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());
			ps.setInt(2, dto.getNum());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getUserimg());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getContent());
			ps.setInt(7, dto.getRef());
			ps.setInt(8, max+1);
		
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
	
	/*게시물 삭제 후 댓글삭제  관련메서드 */
	public int content_commentDel_idx(int idx) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="delete from yagaja_comment where idx=?";
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
	
	/*댓글 삭제 관련메서드 */
	public int content_commentDel(int ref) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="delete from yagaja_comment where ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
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
	
	/*댓글 삭제 관련메서드 */
	public int content_commentDel_lev(int lev) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="delete from yagaja_comment where lev=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, lev);
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
	
	
	//ref 마지막값 추출관련 메서드
	public int getMaxRef() {
		try {
			String sql="select max(ref) from yagaja_comment";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}
			return max;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	
	//ref 마지막값 추출관련 메서드
		public int getMaxLev() {
			try {
				String sql="select max(lev) from yagaja_comment";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				int max=0;
				if(rs.next()) {
					max=rs.getInt(1);
				}
				return max;
			}catch(Exception e) {
				e.printStackTrace();
				return 0;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
				}catch(Exception e2) {}
			}
		}
	
	/*수정 관련메서드 */
	public int commentUpdate(CommentDTO dto,int ref) {
		try{
			conn=yagaja.db.YagajaDB.getConn();
			String sql="update yagaja_comment set content=? where ref=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setInt(2, ref);
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
}
