package com.bit.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.bean.Item3d;
import com.bit.dao.Item3dDao;
import com.bit.uti.DbUtil;

public class Search extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String words = req.getParameter("keywords");
		String[] word ;
		if(words.contains(",")){
			word = words.split(",");
		}else /*if(words.contains("，"))*/{
			word = words.split("，");
		}
		List<String> keywords = new ArrayList<String>();
		for(int i=0;i<word.length;i++){
			keywords.add(word[i]);
		}
		Item3dDao dao = new Item3dDao();
        DbUtil db = new DbUtil();
		try {
			Connection con = db.getCon();
			List<Item3d> result = dao.searchKeyWords(con, keywords);
			req.setAttribute("result", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("存入数据库出错");
			e.printStackTrace();
		}
		req.getRequestDispatcher("/result.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}
	
	
}
