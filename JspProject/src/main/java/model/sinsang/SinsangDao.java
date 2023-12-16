package model.sinsang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DBConnect;

//메서드 만드는곳
public class SinsangDao {

	DBConnect db=new DBConnect();
	
	//insert
	public void insertSinsang(SinsangDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into sinsang values(seq1.nextval,?,?,sysdate)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//select
	public Vector<SinsangDto> getAllDatas()
	{
		Vector<SinsangDto> list=new Vector<SinsangDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from sinsang order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//여러데이타 읽을경우
			while(rs.next())
			{
				//dto선언..반드시 while문 안에서
				SinsangDto dto=new SinsangDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
				//벡터에 추가
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
	
	//삭제
	public void deleteSinsang(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from sinsang where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//하나의 데이터 조회
	public SinsangDto getData(String num)
	{
		SinsangDto dto=new SinsangDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from sinsang where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//하나의 데이터 조회시 if 여러개 while
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
	}
	
	//수정..이름 주소 수정
	public void updateSinsang(SinsangDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update sinsang set name=?,addr=? where num=?";
		
		try {
			//? 바인딩
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getNum());
			
			//실행
			pstmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			db.dbClose(pstmt, conn);
		}
	}
}
