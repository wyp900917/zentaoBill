package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.personYearInfo;

public class userPerYearDAO {

	public userPerYearDAO() {
	}

	/**
	 * 根据年份查询所有用户中该年投入工时最长的5个人信息
	 * 
	 * @return
	 */
	public static List<personYearInfo> selectTop5(int year) {
		String sql = "select * from personperyear where key like '%@" + year
				+ "' order by consume desc limit(5)";
		List<personYearInfo> list_person = new ArrayList<personYearInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_person.add(new personYearInfo(rs.getString("key").split("@")[0], rs
						.getInt("taskid"), rs.getDouble("consume"), rs
						.getDouble("tconsume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_person;
	}
}
