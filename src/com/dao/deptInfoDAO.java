package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.deptInfo;

public class deptInfoDAO {

	public deptInfoDAO() {
	}

	/**
	 * 查询所有一级部门信息，parent为0
	 * 
	 * @return
	 */
	public static List<deptInfo> selectAllDept() {
		String sql = "select * from dept where parent = 0";
		List<deptInfo> list_dept = new ArrayList<deptInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_dept.add(new deptInfo(rs.getInt("id"), rs
						.getString("name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_dept;
	}

	/**
	 * 根据部门的ID查询该部门的所有团队信息
	 * 
	 * @return
	 */
	public static List<deptInfo> selectTeam(int id) {
		String sql = "select * from dept where parent =" + id;
		List<deptInfo> list_dept = new ArrayList<deptInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_dept.add(new deptInfo(rs.getInt("id"), rs
						.getString("name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_dept;
	}
	
	/**
	 * 根据部门的ID查询部门信息
	 * 
	 * @return
	 */
	public static deptInfo selectDept(int id) {
		String sql = "select * from dept where id =" + id;
		deptInfo dept = null;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				dept = new deptInfo(rs.getInt("id"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dept;
	}
}
