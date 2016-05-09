package com.bit.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.bean.Item3d;
import com.bit.dao.Item3dDao;

public class ClassSearchServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String modeltype = request.getParameter("modeltype");
		if(modeltype.equals("people")){
			modeltype="人物";
		}else if(modeltype.equals("art")){
			modeltype="建筑";
		}else if(modeltype.equals("play")){
			modeltype="玩具";
		}else if(modeltype.equals("else")){
			modeltype="其他";
		}
//		modeltype = new String(modeltype.getBytes("iso8859-1"),"UTF-8");
		Item3dDao dao = new Item3dDao();
		try {
			List<Item3d> result = dao.searchByclass(modeltype);
			request.setAttribute("results", result);
			System.out.println(result.size());
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			System.out.println("存入数据库出错");
			e.printStackTrace();
		}
		request.getRequestDispatcher("/jsp/list.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
