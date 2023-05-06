package com.pfs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@WebServlet("/deleteBill")
public class Servlet_deleteBill extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	int id = Integer.parseInt(request.getParameter("id"));
    	TransactionDAO transactionDAO = new TransactionDAO();
    	int res = transactionDAO.deleteTransaction(id);
    	if (res >= 0) {
			System.out.println("删除成功");
    	} else {
    		System.out.println("删除失败");
    	}
    	response.sendRedirect("sub_accountBook");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
