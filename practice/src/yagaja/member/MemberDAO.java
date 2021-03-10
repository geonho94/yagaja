package yagaja.member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	 
	public MemberDAO() {
		
	}
	
	/*로그인 메서드*/
	public int login(String id, String pwd) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select pwd from yagaja_user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				String dbpwd=rs.getString(1);
				if(dbpwd.equals(pwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}

	/*회원 정보 가져오기 메서드*/
	public MemberDTO getUser(String id) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select * from yagaja_user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String pwd = "";
			String email = rs.getString("email");
			String tel = rs.getString("tel");
			String img = rs.getString("img");
			java.sql.Date joindate = rs.getDate("joindate");
			
			MemberDTO dto = new MemberDTO(idx, id, pwd, name, email, tel, img, joindate);
			
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*아이디 중복확인 결과 메서드*/
	public boolean idCheck_ok(String id) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select id from yagaja_user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*회원가입 메서드*/
	public int memberJoin(MemberDTO dto) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="insert into yagaja_user values(yagaja_user_idx.nextval,?,?,?,?,?,'user.jpg',sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getTel());
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*name,email로 해당 아이디,가입날짜 가져오기*/
	public ArrayList<MemberDTO> idsr(String name, String email){
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select id,joindate from yagaja_user where name=? and email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			rs=ps.executeQuery();
			ArrayList<MemberDTO> arr=new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				String id=rs.getString("id");
				java.sql.Date joindate=rs.getDate("joindate");
				MemberDTO dto=new MemberDTO();
				dto.setId(id);
				dto.setJoindate(joindate);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*비밀번호 찾기:DB에 있는 id,email과 내가 입력한 id,email 비교*/
	public boolean pwdSearch(String id, String email) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select id, email from yagaja_user where id=? and email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			rs=ps.executeQuery();
			return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*비밀번호 재설정(기존비번과 동일한 경우)*/
	public boolean pwdRe(String id, String pwd) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select * from yagaja_user where id=? and pwd=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs=ps.executeQuery();
			return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/*비밀번호 재설정(기존비번과 달라서 비밀번호 재설정 완료한 경우)*/
	public int pwdRe_ok (String id, String pwd){
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="update yagaja_user set pwd=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			}catch(Exception e2) {
				
			}
		}
	}/**회원 정보 수정을 위한 조회 메서드*/
	public MemberDTO yagajaUpdateFind(String id) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="select * from yagaja_user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			MemberDTO dto=null;
			if(rs.next()) {
			
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String tel=rs.getString("tel");
				java.sql.Date joindate=rs.getDate("joindate");
				
				dto=new MemberDTO(pwd, name, email, tel, joindate);
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
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**회원정보 수정을 위한 메서드*/
	public int yagajaUpdate(MemberDTO dto) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="update yagaja_user set pwd=?, name=?, email=?, tel=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getId());
		
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	/**회원번호 삭제를 위한 메서드*/
	public int yagajaDelete(String id) {
		try {
			conn=yagaja.db.YagajaDB.getConn();
			String sql="delete yagaja_user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			int count=ps.executeUpdate();
			System.out.println("ccount"+count);
			return count;
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			
			}
		}
	}
}
