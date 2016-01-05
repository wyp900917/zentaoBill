package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class H2Conn {

	private static final String JDBC_URL = "jdbc:h2:";

	private static final String db_local = "/db/zendao";

	private static final String USER = "sa";

	private static final String PASSWORD = "123";

	private static final String DRIVER_CLASS = "org.h2.Driver";

	private static Connection conn = null;

	private static Statement stmt = null;

	private H2Conn() {
	}

	/**
	 * 获取一个h2数据库连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		if (null == conn) {
			try {
				Class.forName(DRIVER_CLASS);
				conn = DriverManager.getConnection(JDBC_URL + "C:\\workspace\\zentaoBill\\"
						+ db_local, USER, PASSWORD);
//				conn = DriverManager.getConnection(JDBC_URL + "/home/tsaip"
//						+ db_local, USER, PASSWORD);
			} catch (ClassNotFoundException e) {
				System.out.println("数据库驱动加载失败！");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("创建数据库连接失败！");
				e.printStackTrace();
			}
			return conn;
		} else
			return conn;
	}

	/**
	 * 获取一个stmt实例
	 * 
	 * @return
	 */
	public static Statement getStmt() {
		if (null == stmt) {
			try {
				stmt = getConn().createStatement();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return stmt;
		} else
			return stmt;
	}

	public static void selectValue(String tableName) {
		String sql = "select * from "+tableName;
		try {
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println(rs.getString("key"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭数据库连接
	 */
	public static void Close() {
		try {
			if (null != conn)
				conn.close();
			if (null != stmt)
				stmt.close();
		} catch (SQLException e) {
			System.out.println("数据库关闭异常！");
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		String sql = "select * from userinfo";
		try {
			ResultSet rs = getStmt().executeQuery(sql);
			while(rs.next()) {
				System.out.println(rs.getString("turnover"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
