package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.userInfo;

public class userInfoDAO {

	public userInfoDAO() {
	}

	/**
	 * ��ѯ����δ��ɾ�������û���Ϣ
	 * 
	 * @return
	 */
	public static List<userInfo> selectAllUser() {
		String sql = "select * from userInfo where deleted =0 and(dept=1 or dept=5 or dept=6 or dept=9 or dept=22 or account='liu.yuanyuan' or account='yu.meiling')";
		List<userInfo> list_user = new ArrayList<userInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_user.add(new userInfo(rs.getString("account"), rs
						.getString("name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_user;
	}

	/**
	 * �����û����˺Ų�ѯ�û���
	 * 
	 * @return
	 */
	public static userInfo selectUser(String account) {
		String sql = "select * from userInfo where account ='" + account + "'";
		userInfo user = null;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				user = new userInfo(rs.getString("account"),
						rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * �����û���������ѯ�û��˻�
	 * 
	 * @return
	 */
	public static String selectUserByname(String name) {
		String sql = "select account from userInfo where name ='" + name + "'";
		String account = null;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				account = rs.getString("account");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return account;
	}

	/**
	 * ���ݲ���ID��ѯ�ò��ŵ������û���Ϣ
	 * 
	 * @return
	 */
	public static List<userInfo> selectAllUserByDept(int dept) {
		String sql = "select * from userInfo where deleted='0' and dept = "
				+ dept;
		List<userInfo> list_user = new ArrayList<userInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_user.add(new userInfo(rs.getString("account"), rs
						.getString("name"), rs.getString("role")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_user;
	}
}
