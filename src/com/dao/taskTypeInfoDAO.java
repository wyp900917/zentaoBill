package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.taskTypeInfo;

public class taskTypeInfoDAO {

	public taskTypeInfoDAO() {
	}

	public static List<taskTypeInfo> selectTaskType(String account, String year) {
		String sql1 = "select sum(consumed) as total from tasktypeyear where key like '"
				+ account + "%" + year + "'";
		String sql2 = "select * from tasktypeyear where key like '" + account
				+ "%" + year + "'";
		List<taskTypeInfo> list_tasktype = new ArrayList<taskTypeInfo>();
		double sum = 0;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql1);
			if(rs.next())
				sum = rs.getDouble("total");
			ResultSet rs2 = H2Conn.getStmt().executeQuery(sql2);
			while (rs2.next()) {
				list_tasktype.add(new taskTypeInfo(rs2.getString("key").split(
						"@")[1], rs2.getDouble("consumed") / sum * 100));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_tasktype;
	}
}
