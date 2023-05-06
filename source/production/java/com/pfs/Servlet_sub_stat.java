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

@WebServlet("/sub_stat")
public class Servlet_sub_stat extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TransactionDAO transactionDAO = new TransactionDAO();
		List<Transaction> transactionsList = transactionDAO.getAllTransactions(1);
		double totalIncome = 0;
		double totalExpend = 0;
		double catering = 0;
		double transportation = 0;
		double shopping = 0;
		double daily_expense = 0;
		double other = 0;
		double salary = 0;
		double property = 0;
		double exOther = 0;

		for (Transaction t : transactionsList) {
			if (t.getBill_type().equals("0")) {
				totalIncome += t.getAmount();
			} else if (t.getBill_type().equals("1")) {
				totalExpend += t.getAmount();
			}
		}

		for (Transaction t : transactionsList) {
			if (t.getCategory().equals("catering")) {
				catering += t.getAmount();
			} else if (t.getCategory().equals("transportation")) {
				transportation += t.getAmount();
			} else if (t.getCategory().equals("shopping")) {
				shopping += t.getAmount();
			} else if (t.getCategory().equals("daily expense")) {
				daily_expense += t.getAmount();
			} else if (t.getCategory().equals("other")) {
				other += t.getAmount();
			}
		}

		for (Transaction t : transactionsList) {
			if (t.getCategory().equals("salary income")) {
				salary += t.getAmount();
				System.out.println(salary);
			} else if (t.getCategory().equals("property income")) {
				property += t.getAmount();
			} else if (t.getCategory().equals("other income")) {
				exOther += t.getAmount();
			}
		}

		List<Double> incomeList = new ArrayList<>();
		List<Double> expendList = new ArrayList<>();
		catering = (catering * 100.0) / totalExpend;
		transportation = (transportation * 100.0) / totalExpend;
		shopping = (shopping * 100.0) / totalExpend;
		daily_expense = (daily_expense * 100.0) / totalExpend;
		other = (other * 100.0) / totalExpend;
		salary = (salary * 100.0) / totalIncome;
		property = (property * 100.0) / totalIncome;
		exOther = (exOther * 100.0) / totalIncome;
		System.out.println(totalIncome);
		System.out.println(salary);


		expendList.add(catering);
		expendList.add(transportation);
		expendList.add(shopping);
		expendList.add(daily_expense);
		expendList.add(other);
		incomeList.add(salary);
		incomeList.add(property);
		incomeList.add(exOther);
		request.getSession().setAttribute("incomeList", incomeList);
		request.getSession().setAttribute("expendList", expendList);
		request.getRequestDispatcher("/sub_stat.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}