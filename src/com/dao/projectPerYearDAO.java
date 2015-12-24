package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.db.H2Conn;
import com.model.personYearInfo;
import com.model.projectConsumeInfo;

public class projectPerYearDAO {

	public projectPerYearDAO() {
	}

	/**
	 * 根据账号和年份查询个人一年中耗时最长的项目
	 * 
	 * @param account
	 * @param year
	 * @return List<projectConsumeInfo>
	 */
	public static List<projectConsumeInfo> selectTopPerYear(String account,
			String year) {
		String sql = "select * from projectperyear where key like '" + account
				+ "%" + year + "'";
		List<projectConsumeInfo> list = new ArrayList<projectConsumeInfo>();
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new projectConsumeInfo(Integer.parseInt(rs.getString(
						"key").split("@")[1]), rs.getString("projectname"), rs
						.getDouble("pconsume"), rs.getString("longtaskname"),
						rs.getDouble("ltconsume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.sort(list);
		return list;
	}

	/**
	 * 根据项目的ID查询在该项目中投入工时最多的5个人信息
	 * 
	 * @param projectid
	 * @return
	 */
	public static List<projectConsumeInfo> selectTop5Consumed(int projectid) {
		List<projectConsumeInfo> list = new ArrayList<projectConsumeInfo>();
		String sql = "select * from projectperyear where key like '%@"
				+ projectid + "@%' order by pconsume desc limit(5)";
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new projectConsumeInfo(
						rs.getString("key").split("@")[0], rs
								.getString("projectname"), rs
								.getDouble("pconsume"), rs
								.getString("longtaskname"), rs
								.getDouble("ltconsume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据产品的ID查询在该产品中投入工时最多的5个人信息
	 * 
	 * @param projectid
	 * @return
	 */
	public static List<personYearInfo> selectTop5ConsumedByProductID(
			int productid, int year) {
		List<personYearInfo> list = new ArrayList<personYearInfo>();
		String sql = "select substring(key,1,(charindex('@',key)-1)) as account,sum(pconsume) as total, max(ltconsume) as max from projectperyear as p, product_project as q where q.productid="
				+ productid
				+ " and p.key like concat('%@',q.projectid,'@"
				+ year + "') group by account order by total desc limit(5)";
		ResultSet rs;
		try {
			rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list.add(new personYearInfo(rs.getString("account"), rs
						.getDouble("total"), rs.getDouble("max")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据产品的ID查询在该产品中投入工时最多的5个人信息
	 * 
	 * @param projectid
	 * @return
	 */
	public static String selectTasknameByConsume(String account, int year,
			double consume) {
		String sql = "select longtaskname from projectperyear where key like '"
				+ account + "@%@" + year + "' and ltconsume=" + consume;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				return rs.getString("longtaskname");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
}
