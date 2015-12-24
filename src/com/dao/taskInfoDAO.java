package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.db.H2Conn;
import com.model.taskInfo;
import com.model.taskTypeInfo;

public class taskInfoDAO {

	public taskInfoDAO() {
	}

	/**
	 * ��ѯ�������������Ϣ
	 * 
	 * @return
	 */
	public static List<taskInfo> selectAllTask() {
		String sql = "select * from taskInfo";
		List<taskInfo> list_task = new ArrayList<taskInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_task.add(new taskInfo(rs.getInt("id"), rs
						.getInt("projectid"), rs.getString("name"), rs
						.getString("taskmanager"), rs.getDouble("consumed"), rs
						.getString("startdate"), rs.getString("finishdate"), rs
						.getString("type")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_task;
	}

	/**
	 * ������Ŀ��ID��ѯ����Ŀ�к�ʱ���10�����񣬲���ʱ���������
	 * 
	 * @param projectid
	 * @return
	 */
	public static List<taskInfo> selectTop10(int projectid) {
		List<taskInfo> list_task = new ArrayList<taskInfo>();
		String sql = "select * FROM taskinfo where projectid=" + projectid
				+ " order by consumed desc limit(10)";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_task.add(new taskInfo(rs.getInt("id"), rs
						.getInt("projectid"), rs.getString("name"), rs
						.getString("taskmanager"), rs.getDouble("consumed"), rs
						.getString("startdate"), rs.getString("finishdate"), rs
						.getString("type")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Collections.sort(list_task);
		return list_task;
	}

	/**
	 * ������Ŀ��ID��ѯ����Ŀ��Ͷ�빤ʱ���5������
	 * 
	 * @param projectid
	 * @return List<taskInfo>
	 */
	public static List<taskInfo> selectTop5Task(int projectid) {
		List<taskInfo> list_task = new ArrayList<taskInfo>();
		String sql = "select * FROM taskinfo where projectid=" + projectid
				+ " order by consumed desc limit(5)";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_task.add(new taskInfo(rs.getInt("id"), rs
						.getInt("projectid"), rs.getString("name"), rs
						.getString("taskmanager"), rs.getDouble("consumed"), rs
						.getString("startdate"), rs.getString("finishdate"), rs
						.getString("type")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_task;
	}
	
	/**
	 * ������Ŀ��ID��ѯ����Ŀ��Ͷ�빤ʱ�����������
	 * 
	 * @param projectid
	 * @return String
	 */
	public static String selectTop1Task(int projectid) {
		String sql = "select name FROM taskinfo where projectid=" + projectid
				+ " order by consumed desc limit(1)";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				return rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * ������Ŀ��ID��ѯ����Ŀ����������
	 * 
	 * @param projectid
	 * @return List<taskTypeInfo>
	 */
	public static List<taskTypeInfo> selectTaskType(int projectid) {
		List<taskTypeInfo> list_tasktype = new ArrayList<taskTypeInfo>();
		String sql = "select sum(consumed) as total from taskinfo where projectid="
				+ projectid;
		String sql1 = "select sum(consumed) as total,type from taskinfo where projectid="
				+ projectid + " group by type";
		double sum = 0.0;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next())
				sum = rs.getDouble("total");
			ResultSet rs2 = H2Conn.getStmt().executeQuery(sql1);
			while (rs2.next()) {
				list_tasktype.add(new taskTypeInfo(rs2.getString("type"), rs2
						.getDouble("total") / sum * 100));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_tasktype;
	}

	/**
	 * ���������ID��ѯ������Ϣ
	 * 
	 * @return
	 */
	public static String selectTaskname(int id) {
		String sql = "select * from taskInfo where id =" + id;
		String taskname = "";
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				taskname = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return taskname;
	}
}
