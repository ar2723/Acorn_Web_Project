package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.member.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	//1.
	private TodoDao() {}
	//3.
	public static TodoDao getInstance() {
		//서버 시작후 최초 요청이라면
		if(dao == null) {
			//객체를 생성해서 static 필드에 저장해놓는다.
			dao = new TodoDao();
		}
		//필드에 저장된 참조값 리턴해주기
		return dao;
	}
	
	public List<TodoDto> getList(){
		//회원 목록을 담을 객체 미리 생성하기
		List<TodoDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num, list, impo, due"
					+ " FROM todos"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성

			//select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				//ResultSet에 cursor가 위치 한 곳의 칼럼 정보를 얻어와서 MemberDto 객체에 담고
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setList(rs.getString("list"));
				dto.setImpo(rs.getString("impo"));
				dto.setDue(rs.getString("due"));
				//ArrayList 객체에 누적시키기
				list.add(dto);
			}
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
		return list;
	}
	
	public boolean insert(TodoDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO todos"
					+ " (num, list, impo, due)"
					+ " VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getList());
			pstmt.setString(3, dto.getImpo());
			pstmt.setString(4, dto.getDue());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM todos"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
}
