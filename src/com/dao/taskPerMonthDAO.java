package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.db.H2Conn;
import com.model.taskConsumedInfo;

public class taskPerMonthDAO {

	public taskPerMonthDAO() {
	}

	/**
	 * 按照用户名称查询该用户每月的1-3个重点任务
	 * 
	 * @param account
	 * @return
	 */
	public static List<taskConsumedInfo> selectTopPerMonth(String account,
			String date) {
		String sql = "select * from taskpermonth where key like '" + account
				+ "%" + date + "'";
		List<taskConsumedInfo> list = new ArrayList<taskConsumedInfo>();
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new taskConsumedInfo(rs.getString("taskname"), rs
						.getDouble("consume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.sort(list);
		return list;
	}

	/**
	 * 根据项目ID查询该项目的每月Top3任务
	 * 
	 * @param projectid
	 * @param date
	 * @return
	 */
	public static List<taskConsumedInfo> selectTop3PerMonth(int projectid,
			String date) {
		String sql = "select * from projectpermonth where key like '"
				+ projectid + "@%@" + date + "' order by consume desc";
		List<taskConsumedInfo> list = new ArrayList<taskConsumedInfo>();
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new taskConsumedInfo(rs.getString("taskname"), rs
						.getDouble("consume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
