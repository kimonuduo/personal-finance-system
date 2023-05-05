package com.pfs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;
import java.sql.Date;

public class Transaction{
	private Integer id;
	private Integer user_id;
	private Double amount;
	private String bill_type;
	private String expend_type;
	private String category;
	private String remark;
	private Date bill_time;
	
	public Transaction(Integer id, Integer user_id, Double amount, String bill_type, String expend_type, String category, String remark, Date bill_time) {
		this.user_id = id;
		this.user_id = user_id;
		this.amount = amount;
		this.bill_type = bill_type;
		this.expend_type = expend_type;
		this.category = category;
		this.remark = remark;
		this.bill_time = bill_time;
	}
	
	@Override
	public String toString() {
		return "Transaction [id=" + id + ", "
				+ "user_id=" + user_id 
				+ ", amount=" + amount 
				+ ", bill_type="+ bill_type 
				+ ", expend_type=" + expend_type 
				+ ", category=" + category 
				+ ", remark=" + remark 
				+ ", bill_time="+ bill_time + "]";
	}

	public Double getamount() {
		return amount;
	}
	public void setamount(Double amount) {
		this.amount = amount;
	}
	public String getexpend_type() {
		return expend_type;
	}
	public void setexpend_type(String expend_type) {
		this.expend_type = expend_type;
	}

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getbill_type() {
		return bill_type;
	}
	public void setbill_type(String bill_type) {
		this.bill_type = bill_type;
	}
	public String getremark() {
		return remark;
	}
	public void setremark(String remark) {
		this.remark = remark;
	}
	public Integer getUser_id() {
		return user_id;
	}


	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}


	public String getBill_type() {
		return bill_type;
	}


	public void setBill_type(String bill_type) {
		this.bill_type = bill_type;
	}


	public String getExpend_type() {
		return expend_type;
	}


	public void setExpend_type(String expend_type) {
		this.expend_type = expend_type;
	}



	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Date getBill_time() {
		return bill_time;
	}


	public void setBill_time(Date bill_time) {
		this.bill_time = bill_time;
	}
	
}
