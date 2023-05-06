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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class TransactionDAO {

	// Add Bill 添加
	public void addBill(Transaction bill) {
		try {
			Connection conn = JdbcUtil.getConnection();
			String sql = "INSERT INTO bill (user_id, amount, bill_type, category,bill_time) values(?,?,?,?,?) ";
			PreparedStatement stm = conn.prepareStatement(sql);
			stm.setInt(1, bill.getUser_id());
			stm.setDouble(2, bill.getAmount());
			stm.setString(3, bill.getBill_type());
			stm.setString(4, bill.getCategory());
			stm.setDate(5, bill.getBill_time());
			int res = stm.executeUpdate();

			JdbcUtil.free(null, stm, conn);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// getAllBill 查询所有
	public List<Transaction> getAllTransactions(int user_id) {
		try {
			Connection con = JdbcUtil.getConnection();
			String sql = "select * from bill where user_id = ? ";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, user_id);
			ResultSet res = stm.executeQuery();
			List<Transaction> transactionslist = new ArrayList<>();
			while (res.next()) {
				Integer id = res.getInt("id");
				Double amount = res.getDouble("amount");
				String bill_type = res.getString("bill_type");
				String expend_type = res.getString("expend_type");
				String category = res.getString("category");
				String remark = res.getString("remark");
				Date bill_time = res.getDate("bill_time");
				transactionslist.add(new Transaction(id, user_id, amount, bill_type, expend_type, category, remark, bill_time));
			}
			JdbcUtil.free(res, stm, con);
			return transactionslist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 删除
	public int deleteTransaction(int id) {
		int res = 0;
		try {
			Connection con = JdbcUtil.getConnection();
			String sql = "delete from bill where id=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			res = stm.executeUpdate();
			JdbcUtil.free(null, stm, con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;

	}

}
