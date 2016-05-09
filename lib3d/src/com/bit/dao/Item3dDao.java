package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bit.bean.Item3d;
import com.bit.uti.DbUtil;

public class Item3dDao {
	public void viewTimes(String id){
		String sql="update item3d set viewtimes=viewtimes+1 where id="+id;
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.execute();
			db.closeCon(con);
		} catch (Exception e) {
			db.closeCon(con);
		}
	}
	
	public void addLoadTimes(String id){
		String sql="update item3d set loadtimes=loadtimes+1 where id="+id;
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.execute();
			db.closeCon(con);
		} catch (Exception e) {
			db.closeCon(con);
		}
		
	}
	public int insertItem(/*Connection con*//*, int id*/int loadtimes,String filename
			,String picname,String detail, String keywords,String name,String modeltype,String updatetime) {
		String sql = "INSERT INTO item3d (loadtimes,filename,picname,detail,keywords,name,modeltype,updatetime,score) "
								+ "	VALUES (?,?,?,?,?,?,?,?,5)";
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, loadtimes);
			pstmt.setString(2, filename);
			pstmt.setString(3, picname);
			pstmt.setString(4, detail);
			pstmt.setString(5, keywords);
			pstmt.setString(6, name);
			pstmt.setString(7, modeltype);
			pstmt.setString(8, updatetime);
			pstmt.execute();
			
			
			db.closeCon(con);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			db.closeCon(con);
			return 0;
		}
	}
	public Item3d getItemByPicname(String picname){
		String sql = "select * from item3d where picname='"+picname+"'";
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Item3d item=new Item3d();
				item.setId(rs.getInt("id"));
				item.setDetail(rs.getString("detail"));
				item.setFilename(rs.getString("filename"));
				item.setKeywords(rs.getString("keywords"));
				item.setPicname(rs.getString("picname"));
				item.setName(rs.getString("name"));
//				item.setKeywords(rs.getString(""));
				String time = rs.getString("updatetime");
				item.setUpdatetime(getTimeString(time));
				item.setLoadtimes(rs.getInt("loadtimes"));
				System.out.println(item.getDetail());
				db.closeCon(con);
				return item;
			}
		} catch (SQLException e) {
			db.closeCon(con);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Item3d getItemByid(String id){
		viewTimes( id);
		String sql = "select * from item3d where id='"+id+"'";
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Item3d item=new Item3d();
				item.setId(rs.getInt("id"));
				item.setDetail(rs.getString("detail"));
				item.setFilename(rs.getString("filename"));
				item.setKeywords(rs.getString("keywords"));
				item.setPicname(rs.getString("picname"));
				item.setViewtimes(rs.getInt("viewtimes"));
				String time = rs.getString("updatetime");
				item.setUpdatetime(getTimeString(time));
				item.setName(rs.getString("name"));
//				item.setKeywords(rs.getString(""));
				item.setLoadtimes(rs.getInt("loadtimes"));
				System.out.println(item.getDetail());
				db.closeCon(con);
				return item;
			}
		} catch (SQLException e) {
			db.closeCon(con);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Item3d> searchKeyWords(/*Connection con,*/List<String> keywords) {
		StringBuffer sb = new StringBuffer("select * from item3d t1");
		for(int i=0 ;i<keywords.size();i++){
			sb.append(" and t1.keywords like '%"+keywords.get(i)+"%'");
		}
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		List<Item3d> list = new ArrayList<Item3d>();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sb.toString().replaceFirst("and", "where"));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Item3d item=new Item3d();
				item.setId(rs.getInt("id"));
				item.setDetail(rs.getString("detail"));
				item.setFilename(rs.getString("filename"));
				item.setKeywords(rs.getString("keywords"));
				item.setPicname(rs.getString("picname"));
				item.setName(rs.getString("name"));
				item.setViewtimes(rs.getInt("viewtimes"));
				String time = rs.getString("updatetime");
				item.setUpdatetime(getTimeString(time));
//				item.setKeywords(rs.getString(""));
				item.setLoadtimes(rs.getInt("loadtimes"));
				System.out.println(item.getDetail());
				list.add(item);
			}
			db.closeCon(con);
			return list;
		} catch (SQLException e) {
			db.closeCon(con);
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	public List<Item3d> searchByclass(/*Connection con,*/String modeltype) {
		StringBuffer sb = new StringBuffer("select * from item3d  where modeltype='"+modeltype+"'");
		
		DbUtil db = new DbUtil();
		Connection con=db.getCon();
		List<Item3d> list = new ArrayList<Item3d>();
		System.out.println(":::::::");
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item3d item=new Item3d();
				System.out.println(":::::::");
				item.setId(rs.getInt("id"));
				item.setDetail(rs.getString("detail"));
				item.setFilename(rs.getString("filename"));
				item.setKeywords(rs.getString("keywords"));
				item.setPicname(rs.getString("picname"));
				item.setName(rs.getString("name"));
				item.setViewtimes(rs.getInt("viewtimes"));
				String time = rs.getString("updatetime");
				item.setUpdatetime(getTimeString(time));
//				item.setKeywords(rs.getString(""));
				item.setLoadtimes(rs.getInt("loadtimes"));
				System.out.println(item.getDetail());
				list.add(item);
			}
			db.closeCon(con);
			return list;
		} catch (SQLException e) {
			db.closeCon(con);
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	public static void main(String[] s){
		Item3dDao dao = new Item3dDao();
		try {
			List<String> keywords = new ArrayList<String>();
			keywords.add("3d");
			keywords.add("哈哈1");
			dao.searchByclass("玩具");
			System.out.println(getTimeString("20160802122512"));
//			dao.insertItem(2, "add", "aa", "a", "hhh哈哈哈13d","aaaa","aa","");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static String getTimeString(String timestring) {
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		 try {
			Date da = dateFormat.parse(timestring);
			SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateF.format(da);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}//format( "20160508113929");
	}
}
