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
	 * �����û����Ʋ�ѯ���û�ÿ�µ�1-3���ص�����
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
	 * ������ĿID��ѯ����Ŀ��ÿ��Top3����
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
