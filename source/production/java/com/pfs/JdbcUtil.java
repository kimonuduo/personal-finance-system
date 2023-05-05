package com.system.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcUtil {

	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	private static Properties pr = new Properties();

	static {
		try {
			pr.load(JdbcUtil.class.getClassLoader().getResourceAsStream("jdbc.properties"));
			driver = pr.getProperty("jdbc.driver");
			url = pr.getProperty("jdbc.url");
			username = pr.getProperty("jdbc.username");
			password = pr.getProperty("jdbc.password");
			Class.forName(driver);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	public static void free(ResultSet res, Statement st, Connection con) {
		if (res != null) {
			try {
				res.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
