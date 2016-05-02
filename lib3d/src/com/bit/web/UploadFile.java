package com.bit.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bit.dao.Item3dDao;
import com.bit.uti.DbUtil;

public class UploadFile extends HttpServlet {
	
	//修改文件
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}
	
	
	public static void main(String[] args) { 
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	}
	
	
//上传文件
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String filename="";
		String picname="";
		String name="";
		String detail;
		String keywords ;
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savefilePath = this.getServletContext().getRealPath("/uploadfile");
        String savepicPath = this.getServletContext().getRealPath("/uploadpic");
        File file = new File(savefilePath);
        //判断上传文件的保存目录是否存在
        if (!file.exists() && !file.isDirectory()) {
            file.mkdir();
        }file = new File(savepicPath);
        //判断上传文件的保存目录是否存在
        if (!file.exists() && !file.isDirectory()) {
            file.mkdir();
        }
        //读取字段值
        name = req.getParameter("name");
        keywords = req.getParameter("keywords");
//        String picname = req.getParameter("pi");
        detail = req.getParameter("detail");
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String time = df.format(new Date()).toString();
        
        //消息提示
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
             //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(req)){
                //按照传统方式获取数据
                return;
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(req);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String upfilename = item.getName();
                    System.out.println(upfilename);
                    if(upfilename==null || upfilename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
//                    upfilename = upfilename.substring(upfilename.lastIndexOf("\\")+1);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //创建一个文件输出流
                    String suf = upfilename.substring(upfilename.lastIndexOf(".")+1);
                    String savePath ="";
                    if("amf".equals(suf)||"stl".equals(suf)){
                    	filename = time+"."+suf;
                    	savePath = savefilePath +"\\"+ filename;
                    }else{
                    	picname = time+"."+suf;
                    	savePath = savefilePath +"\\"+ picname;
                    }
                    FileOutputStream out = new FileOutputStream(savePath);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                }
            }
            //将条目存入数据库中
            Item3dDao dao = new Item3dDao();
            DbUtil db = new DbUtil();
    		try {
    			Connection con = db.getCon();
    			dao.insertItem(con, 0, filename, picname, detail, keywords, name);
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			System.out.println("存入数据库出错");
    			e.printStackTrace();
    		}
        }catch (Exception e) {
            PrintWriter wr = resp.getWriter();
            wr.write("fail");
            wr.flush();
            e.printStackTrace();
            
        }
        PrintWriter wr = resp.getWriter();
        wr.write("success");
        wr.flush();
//        req.setAttribute("message",message);
//        req.getRequestDispatcher("/test/message.jsp").forward(req, resp);

	}

	
}
