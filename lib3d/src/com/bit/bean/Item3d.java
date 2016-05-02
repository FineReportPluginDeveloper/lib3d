package com.bit.bean;

public class Item3d {
	private String name;
	private int id;
	private int loadtimes;
	//picturename是 后台存储文件名字
	private String filename;
	private String picname;
	private String keywords;
	private String detail;
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
	
}
