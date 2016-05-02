package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bit.bean.Item3d;
import com.bit.uti.DbUtil;

public class Item3dDao {

	public int insertItem(/*Connection con*//*, int id*/int loadtimes,String filename
			,String picname,String detail, String keywords,String name) {
		String sql = "INSERT INTO item3d (loadtimes,filename,picname,detail,keywords,name) "
								+ "	VALUES (?,?,?,?,?,?)";
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
			db.closeCon(con);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			db.closeCon(con);
			return 0;
		}
		
		
	}
	public Item3d getItemByid(String id){
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
			dao.searchKeyWords( keywords);
//			dao.insertItem(co, 2, "add", "aa", "a", "hhh哈哈哈13d","aaaa");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
