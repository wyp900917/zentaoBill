package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.db.H2Conn;
import com.model.taskDateInfo;

public class taskPerYearDAO {

	public static List<taskDateInfo> selectTopPerYear(String account,
			String year) {
		String sql = "select * from taskperyear where key like '" + account
				+ "%" + year + "'";
		List<taskDateInfo> list = new ArrayList<taskDateInfo>();
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new taskDateInfo(rs.getString("taskname"), rs
						.getDouble("consumed"), rs.getString("starteddate"), rs
						.getString("finisheddate"), rs.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.sort(list);
		return list;
	}
}
