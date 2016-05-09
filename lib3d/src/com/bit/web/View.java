package com.bit.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.bean.Item3d;
import com.bit.dao.Item3dDao;
	
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		Item3dDao dao = new Item3dDao();
		Item3d item  = dao.getItemByid(id);
		System.out.println(item.getFilename().substring(14));
		String type = item.getFilename().substring(14);
//		filename.
		if(item==null)
		System.out.println(id);
		req.setAttribute("item3d", item);
		req.setAttribute("type", type);
		req.getRequestDispatcher("/jsp/model.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

}
