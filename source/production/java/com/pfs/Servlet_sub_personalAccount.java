package com.pfs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@WebServlet("/sub_personalAccount")
public class Servlet_sub_personalAccount extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		TransactionDAO transactionDAO = new TransactionDAO();
		List<Transaction> transactionsList = transactionDAO.getAllTransactions(1);
		double totalIncome = 0;
		double totalExpend = 0;
		for(Transaction t: transactionsList) {
			if(t.getBill_type().equals("0")) {
				totalIncome += t.getAmount();
			} else if(t.getBill_type().equals("1")) {
				totalExpend += t.getAmount();
			}
		}
		List<Double> dataList= new ArrayList<>();
		totalIncome = Math.round(totalIncome * 100.0) / 100.0;
		totalExpend = Math.round(totalExpend * 100.0) / 100.0;
		dataList.add(totalIncome);
		dataList.add(totalExpend);
		request.getSession().setAttribute("dataList", dataList);
		request.getRequestDispatcher("/sub_personalAccount.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
