package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	//static 필드
	private static FileDao dao;
	//외부에 객체 생성할수 없도록
	private FileDao() {}
	//참조값을 리턴해주는 static 메소드
	public static FileDao getInstance() {
		if(dao == null) {
			dao = new FileDao();
		}
		return dao;
	}
	
	//업로드된 파일 정보를 DB 에 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    int rowCount = 0;
	    try {
	    	conn = new DbcpBean().getConn();
	        String sql = "INSERT INTO board_file"
	        		+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
	        		+ " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
	        pstmt = conn.prepareStatement(sql);
	        // ? 에 바인딩할게 있으면 해주고
	        pstmt.setString(1, dto.getWriter());
	        pstmt.setString(2, dto.getTitle());
	        pstmt.setString(3, dto.getOrgFileName());
	        pstmt.setString(4, dto.getSaveFileName());
	        pstmt.setLong(5, dto.getFileSize());
	        // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
	        rowCount = pstmt.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	        }
	    }
	    if (rowCount > 0) {
	    	return true;
	    } else {
	        return false;
	    }
	}
	
	public List<FileDto> getList(){
		List<FileDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num, writer, title, saveFileName, regdate"
					+ " FROM board_file"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setRegdate(rs.getString("regdate"));
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
	
}
