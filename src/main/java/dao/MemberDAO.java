package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
public MemberDAO() {
		
	}
	
	private static MemberDAO instance = null;
	
	public synchronized static MemberDAO getInstance(){
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	public int insert(MemberDTO dto) throws Exception {

		String sql = "insert into member values(?,?,?,default,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getInformation());
			

			int result = pstat.executeUpdate();
			con.commit();

			return result;

		}
	}
	//ID 중복검사
	public boolean isNickNameExist(String id) throws Exception {

		String sql = "select * from member where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);

			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}
	//email 중복검사
	public boolean isEmailExist(String email) throws Exception {

		String sql = "select * from member where email=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);

			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}
	//로그인시 id PW 검사 
	public boolean isEmailPwExist(String email, String pw) throws Exception {

		String sql = "select * from member where email = ? and pw =?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, pw);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}
	
	//사용자 정보 뽑기
	
	public MemberDTO searchUser(String email) throws Exception {

		String sql = "select * from member where email =?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			try (ResultSet rs = pstat.executeQuery()) {
				
				rs.next();
				String id = rs.getString("id");
				email = rs.getString("email");
				Timestamp join_date = rs.getTimestamp("join_date");
				String information = rs.getString("information");
				return(new MemberDTO(id,null,email,join_date,information));
				
			}
		}
	}

}
