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

@WebServlet("/sub_accountBook")
public class Servlet_sub_accountBook extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	TransactionDAO transactionDAO = new TransactionDAO();
    	List<Transaction> transactionsList = transactionDAO.getAllTransactions(1);
    	request.getSession().setAttribute("transactionsList", transactionsList);
    	request.getRequestDispatcher("/sub_accountBook.jsp").forward(request, response);
    }

}
