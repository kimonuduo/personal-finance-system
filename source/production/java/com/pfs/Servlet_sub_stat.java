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
			if (t.getExpend_type().equals("0")) {
				totalIncome += t.getAmount();
			} else if (t.getExpend_type().equals("1")) {
				totalExpend += t.getAmount();
			}
		}

		for (Transaction t : transactionsList) {
			if (t.getRemark().equals("catering")) {
				catering += t.getAmount();
			} else if (t.getRemark().equals("transportation")) {
				transportation += t.getAmount();
			} else if (t.getRemark().equals("shopping")) {
				shopping += t.getAmount();
			} else if (t.getRemark().equals("daily expense")) {
				daily_expense += t.getAmount();
			} else if (t.getRemark().equals("other")) {
				other += t.getAmount();
			}
		}

		for (Transaction t : transactionsList) {
			if (t.getRemark().equals("salary income")) {
				salary += t.getAmount();
			} else if (t.getRemark().equals("property income")) {
				property += t.getAmount();
			} else if (t.getRemark().equals("other income")) {
				exOther += t.getAmount();
			}
		}

		List<Double> incomeList = new ArrayList<>();
		List<Double> expendList = new ArrayList<>();
		catering = (catering * 100.0) / totalIncome;
		transportation = (transportation * 100.0) / totalIncome;
		shopping = (shopping * 100.0) / totalIncome;
		daily_expense = (daily_expense * 100.0) / totalIncome;
		other = (other * 100.0) / totalIncome;
		salary = (salary * 100.0) / totalExpend;
		property = (property * 100.0) / totalExpend;
		exOther = (exOther * 100.0) / totalExpend;


		incomeList.add(catering);
		incomeList.add(transportation);
		incomeList.add(shopping);
		incomeList.add(daily_expense);
		incomeList.add(other);
		expendList.add(salary);
		expendList.add(property);
		expendList.add(exOther);
		request.getSession().setAttribute("incomeList", incomeList);
		request.getSession().setAttribute("expendList", expendList);
		request.getRequestDispatcher("/sub_stat.jsp").forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
	}