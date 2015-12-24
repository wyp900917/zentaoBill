package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.projectInfo;
import com.model.projectYearInfo;

public class projectInfoDAO {

	public projectInfoDAO() {
	}

	/**
	 * ��ѯ������Ŀ��Ϣ
	 * 
	 * @return
	 */
	public static List<projectInfo> selectAllProject(int year) {
		String sql = "select * from projectinfo as p, projectyear as q where q.id like concat(p.id,'@"+year+"') order by q.consume desc";
		List<projectInfo> list_project = new ArrayList<projectInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_project.add(new projectInfo(rs.getInt("id"), rs
						.getString("name"), rs.getString("type"), rs
						.getString("pm"), rs.getString("startdate"), rs
						.getString("finishdate"), rs.getString("team"), rs
						.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_project;
	}

	/**
	 * ������Ŀ���˺Ų�ѯ��Ŀ��Ϣ
	 * 
	 * @return
	 */
	public static projectInfo selectProject(int id) {
		String sql = "select * from projectInfo where id =" + id;
		projectInfo project = null;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				project = new projectInfo(rs.getInt("id"),
						rs.getString("name"), rs.getString("type"),
						rs.getString("pm"), rs.getString("startdate"),
						rs.getString("finishdate"), rs.getString("team"),
						rs.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return project;
	}

	/**
	 * ��ȡÿ���ڽ����е���Ŀ
	 * 
	 * @param year
	 * @param month
	 * @return List<projectInfo>
	 */
	public static List<projectInfo> selectProjectPerMonth(int year, int month) {
		List<projectInfo> list_project = new ArrayList<projectInfo>();
		String finish = year + "-" + (month > 9 ? month : "0" + month);
		String start = month == 12 ? year + 1 + "-01"
				: (year + "-" + (month + 1 > 9 ? month + 1 : "0" + (month + 1)));

		String sql = "select * from projectInfo where startdate <'" + start
				+ "' and finishdate >'" + finish + "'";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_project.add(new projectInfo(rs.getInt("id"), rs
						.getString("name"), rs.getString("type"), rs
						.getString("pm"), rs.getString("startdate"), rs
						.getString("finishdate"), rs.getString("team"), rs
						.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_project;
	}

	/**
	 * ���ݲ�Ʒ��ID��ȡ�ò�Ʒÿ���ڽ����е���Ŀ
	 * 
	 * @param year
	 * @param month
	 * @return List<projectInfo>
	 */
	public static List<projectInfo> selectProjectPerMonthByProductID(
			int productid, int year, int month) {
		List<projectInfo> list_project = new ArrayList<projectInfo>();
		String finish = year + "-" + (month > 9 ? month : "0" + month);
		String start = month == 12 ? year + 1 + "-01"
				: (year + "-" + (month + 1 > 9 ? month + 1 : "0" + (month + 1)));

		String sql = "select * from projectinfo as p, product_project as q where p.id=q.projectid and q.productid="
				+ productid
				+ " and p.startdate <'"
				+ start
				+ "' and p.finishdate >'" + finish + "'";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_project.add(new projectInfo(rs.getInt("id"), rs
						.getString("name"), rs.getString("type"), rs
						.getString("pm"), rs.getString("startdate"), rs
						.getString("finishdate"), rs.getString("team"), rs
						.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_project;
	}

	/**
	 * ͨ����ĿID��ѯ����Ŀÿ�µ�Ͷ�빤ʱ
	 * 
	 * @param projectid
	 * @param year
	 * @param month
	 * @return double
	 */
	public static double getConsumeBydate(int projectid, int year, int month) {
		String date = year + "-" + (month > 9 ? month : "0" + month);
		double consume = 0.0;
		String sql = "select sum(consume) as consume from projectpermonth where key like '"
				+ projectid + "@%@" + date + "'";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				consume = rs.getDouble("consume");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return consume;
	}

	/**
	 * ������ݻ�ȡ������������Ŀ�к�ʱ���5����Ŀ
	 * 
	 * @param year
	 * @return
	 */
	public static List<projectYearInfo> selectTop10(int year) {
		List<projectYearInfo> list_project = new ArrayList<projectYearInfo>();

		String sql = "select * from projectyear where id like '%@" + year
				+ "' order by consume desc limit(10)";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_project.add(new projectYearInfo(Integer.parseInt(rs
						.getString("id").split("@")[0]), rs
						.getDouble("consume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_project;
	}

	/**
	 * ���ݲ�ƷID�Ż�ȡ�ò�Ʒ������Ŀ�к�ʱ���5����Ŀ
	 * 
	 * @param year
	 * @return
	 */
	public static List<projectYearInfo> selectTop5ByProductID(int productid,
			int year) {
		List<projectYearInfo> list_project = new ArrayList<projectYearInfo>();

		String sql = "select * from projectyear as p, product_project as q where p.id like concat(q.projectid,'@%"
				+ year + "') and q.productid=" + productid + " and q.projectid in(select id from projectinfo) order by p.consume desc limit(5)";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_project.add(new projectYearInfo(Integer.parseInt(rs
						.getString("id").split("@")[0]), rs
						.getDouble("consume")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_project;
	}
}
