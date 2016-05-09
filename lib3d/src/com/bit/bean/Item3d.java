package com.bit.bean;

public class Item3d {
	private int id;
	private int loadtimes;
	private String name;
	//picturename是 后台存储文件名字
	private String filename;
	private String picname;
	private String modeltype;
	private String keywords;
	private String detail;
	private int viewtimes;
	private String updatetime;
	private int score;
	public Item3d(){
		
	}
	
	public Item3d(int loadtimes, String name, String filename, String picname,
			String modeltype, String keywords, String detail,String updatetime) {
		super();
		this.loadtimes = loadtimes;
		this.name = name;
		this.filename = filename;
		this.picname = picname;
		this.modeltype = modeltype;
		this.keywords = keywords;
		this.detail = detail;
		this.updatetime=updatetime;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLoadtimes() {
		return loadtimes;
	}
	public void setLoadtimes(int loadtimes) {
		this.loadtimes = loadtimes;
	}
	public String getPicname() {
		return picname;
	}
	public void setPicname(String picname) {
		this.picname = picname;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getModeltype() {
		return modeltype;
	}
	public void setModeltype(String modeltype) {
		this.modeltype = modeltype;
	}

	public int getViewtimes() {
		return viewtimes;
	}

	public void setViewtimes(int viewtimes) {
		this.viewtimes = viewtimes;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
}
