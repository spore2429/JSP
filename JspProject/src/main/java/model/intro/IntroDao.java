package model.intro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.db.DBConnect;

public class IntroDao {
	
	//db연결
	DBConnect db=new DBConnect();
	
	//insert 
	public void insertIntro(IntroDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into intro values(seq1.nextval,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIntro_name());
			pstmt.setString(2, dto.getIntro_blood());
			pstmt.setString(3, dto.getIntro_hp());
			pstmt.setString(4, dto.getIntro_city());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//select
	public ArrayList<IntroDto>getAllMyIntro()
	{
		ArrayList<IntroDto> list=new ArrayList<IntroDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from intro order by intro_num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				IntroDto dto=new IntroDto();
				
				dto.setIntro_num(rs.getString("intro_num"));
				dto.setIntro_name(rs.getString("intro_name"));
				dto.setIntro_blood(rs.getString("intro_blood"));
				dto.setIntro_hp(rs.getString("intro_hp"));
				dto.setIntro_city(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
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
	
	//delete
	public void deleteIntro(String intro_num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from intro where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, intro_num);
			pstmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//하나만 조회
	public IntroDto getData(String intro_num)
	{
		IntroDto dto=new IntroDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from intro where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, intro_num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setIntro_num(rs.getString("intro_num"));
				dto.setIntro_name(rs.getString("intro_name"));
				dto.setIntro_blood(rs.getString("intro_blood"));
				dto.setIntro_hp(rs.getString("intro_hp"));
				dto.setIntro_city(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
		
		
	}
	
	//update
	
	public void updateIntro(IntroDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update intro set intro_name=?,intro_blood=?,intro_hp=?,intro_city=? where intro_num=?";
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIntro_name());
			pstmt.setString(2, dto.getIntro_blood());
			pstmt.setString(3, dto.getIntro_hp());
			pstmt.setString(4, dto.getIntro_city());
			pstmt.setString(5, dto.getIntro_num());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}