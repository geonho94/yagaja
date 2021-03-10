
package yagaja.noticecscenter;

import java.sql.*;
import java.util.ArrayList;

import yagaja.cscenter.CscenterDTO;

public class NoticeCscenterDAO {
	
	   private Connection conn;
	   private PreparedStatement ps;
	   private ResultSet rs;
	   
	   public NoticeCscenterDAO() {
		System.out.println("noticeCscenterDAO생성자 호출됨~");
	}
	/**공지사항 전체보기 메서드*/   
	   public ArrayList<NoticeCscenterDTO> NoticeList(){//cp 현재위치, ls 는 nav수 보여지는 수 (1 2 3)
			try {
				conn=yagaja.db.YagajaDB.getConn();
				String sql="select * from yagaja_noticecscenter order by idx desc";
//				String sql = "select * from " + 
//						"(select rownum as rnum,a.*from " + 
//						"(select * from jsp_bbs order by ref desc,sunbun asc) a) b " + 
//						"where rnum>=? and rnum<=?";
				//쿼리 복붙하고 /n/t이런거 뜨면 블록잡고 스페이스바로 처리하여 공백으로 만든다.! 
				//ref기준으로 내림차순 정렬, 순번기준으로 오름차순정렬
						ps = conn.prepareStatement(sql);
//						int start = (cp-1)*ls+1;
//						int end = cp*ls;
//						ps.setInt(1, start); //처음
//						ps.setInt(2, end); // 마지막
						rs=ps.executeQuery();
				ArrayList<NoticeCscenterDTO> arr=new ArrayList<NoticeCscenterDTO>();
				while(rs.next()) {
					int idx=rs.getInt("idx");
					String writer=rs.getString("writer");
					String img=rs.getString("img");
					String uploading=rs.getString("uploading");
					String subject=rs.getString("subject");
					String content=rs.getString("content");
					Date writedate=rs.getDate("writedate");
					int ref=rs.getInt("ref");
					int lev=rs.getInt("lev");
					int sunbun=rs.getInt("sunbun");
					
					NoticeCscenterDTO dto=new NoticeCscenterDTO(idx, writer, img, uploading, subject, content, writedate, ref, lev, sunbun);
					arr.add(dto);
					
				}
				return arr;
				}catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				try {
					if(rs!=null)rs.close();		
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}  
	   /**글쓰기 관련 메서드(게시판 선생님코드)*/
	 		public int  CscenterWrite(NoticeCscenterDTO dto) {
	 			try {
	 				conn=yagaja.db.YagajaDB.getConn();
	 				String sql="insert into yagaja_noticecscenter values(yagaja_noticecscenter_idx.nextval,?,0,?,?,?,sysdate,0,0,0)";
	 				//int max=getMaxRef();// 상단 메소드 사용
	 				ps=conn.prepareStatement(sql);
	 				ps.setString(1, dto.getWriter());//글쓴이 저장
	 				ps.setString(2, dto.getImg());//이미지저장
	 				ps.setString(3, dto.getSubject());//제목 넣고
	 				ps.setString(4, dto.getContent());//컨텐츠 넣고
	 				//ps.setInt(5, max+1); // 제일 높은 값 출력한거에서 +1 해줌
	 				int count =ps.executeUpdate();
	 				return count;
	 				
	 			}catch (Exception e) {
	 				e.printStackTrace();
	 				return -1;

	 			}finally {
	 				try {
	 					if(ps!=null)ps.close();
	 					if(conn!=null)conn.close();
	 				}catch (Exception e2) {
	 					// TODO: handle exception
	 				}
	 			}
	 		}
	 		
	 		/**본문 관련 메서드*///게시글 한개 보기 메서드
			public NoticeCscenterDTO getNoticeContent(int idx) {
			
				try {
					conn=yagaja.db.YagajaDB.getConn();
					
//					//조회수 올리기
//					String sql2="update yagaja_cscenter set readnum=readnum+1 where idx=?";//idx기준으로 readnum을 변경
//					ps=conn.prepareStatement(sql2);
//					ps.setInt(1, idx);
//					ps.executeUpdate();
					
					//게시글 한개보기
					String sql="select * from yagaja_noticecscenter where idx=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, idx);
					rs=ps.executeQuery();
					NoticeCscenterDTO dto=null;
					if(rs.next()) {

						//int idx=rs.getInt("idx");
						String writer=rs.getString("writer");
						String img=rs.getString("img");
						String uploading=rs.getString("uploading");
						String subject=rs.getString("subject");
						String content=rs.getString("content");
						java.sql.Date writedate=rs.getDate("writedate");
						int ref=rs.getInt("ref");
						int lev=rs.getInt("lev");
						int sunbun=rs.getInt("sunbun");
						dto=new NoticeCscenterDTO(writer, img, uploading, subject, content, writedate, ref, lev, sunbun);
					}
					return dto;
				}catch (Exception e) {
					e.printStackTrace();
					return null;
				}finally {
					try {
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(conn!=null)conn.close();
					}catch (Exception e2) {
						// TODO: handle exception
					}
					}
				}
			/**수정을 실행하는  메서드*/
			public int yagajaUpdate(NoticeCscenterDTO dto) { 
				try {
					
					conn=yagaja.db.YagajaDB.getConn();
					String sql="update yagaja_noticecscenter set img=?,subject=?,content=? where idx=?";
					
					ps=conn.prepareStatement(sql);
					ps.setString(1, dto.getImg());
					ps.setString(2, dto.getSubject());
					ps.setString(3, dto.getContent());
					ps.setInt(4, dto.getIdx());
					int count = ps.executeUpdate();
				
					return count;
				}catch (Exception e) {
					e.printStackTrace();
					return -1;
				}finally {
					try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch (Exception e) {
					
				}
				}
				
			}
	//-----------------------------
	//select * from yagaja_newcscenter

	//insert into yagaja_newcscenter values(yagaja_newcscenter_idx.nextval,'hong','0','0','안녕하세요','아아',sysdate,0,0,0)

	//update yagaja_newcscenter set subject='안녕',content='오' where idx='4' 

	//delete from yagaja_newcscenter where idx=4

	//drop sequence yagaja_newcscenter_idx

}
