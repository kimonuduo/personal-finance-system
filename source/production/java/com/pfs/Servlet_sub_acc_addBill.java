package com.pfs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/sub_acc_addBill")
public class Servlet_sub_acc_addBill extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    	Double amount = Double.parseDouble(request.getParameter("amount"));
    	String category = request.getParameter("category");
    	String time = request.getParameter("btime");
    
    	String selectedLabel = request.getParameter("selectedLabel");
    	String bill_type = "0";
    	if(selectedLabel.equals("Expenses")) {
    		bill_type = "1";
    	}else if(selectedLabel.equals("Income")){
    		bill_type = "0";
    	}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date = sdf.parse(time);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		java.sql.Date bill_time = new java.sql.Date(date.getTime());
		
		TransactionDAO transactionDAO = new TransactionDAO();
		transactionDAO.addBill(new Transaction(1, amount, bill_type, category, bill_time));
		
		response.sendRedirect("sub_accountBook");
    	
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
