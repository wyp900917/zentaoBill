package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.storyTypeInfo;

public class storyTypeInfoDAO {

	public storyTypeInfoDAO() {
	}

	public static List<storyTypeInfo> selectTaskType(int productid) {
		String sql1 = "select count(*) as total from story where deleted='0' and productid="+productid;
		String sql2 = "select count(*) as num, stage from story where deleted='0' and productid="+productid+" group by stage";
		List<storyTypeInfo> list_tasktype = new ArrayList<storyTypeInfo>();
		double sum = 0;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql1);
			if(rs.next())
				sum = rs.getDouble("total");
			ResultSet rs2 = H2Conn.getStmt().executeQuery(sql2);
			while (rs2.next()) {
				list_tasktype.add(new storyTypeInfo(rs2.getString("stage"), rs2.getInt("num"), rs2.getInt("num") / sum * 100));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_tasktype;
	}
}
