package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.H2Conn;
import com.model.productInfo;

public class productInfoDAO {

	public productInfoDAO() {
	}

	/**
	 * ��ѯ����δɾ���Ĳ�Ʒ��Ϣ
	 * 
	 * @return
	 */
	public static List<productInfo> selectAllProduct() {
		String sql = "select * from product where deleted = 0";
		List<productInfo> list_product = new ArrayList<productInfo>();
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			while (rs.next()) {
				list_product.add(new productInfo(rs.getInt("id"), rs
						.getString("name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_product;
	}

	/**
	 * ���ݲ�ƷID�Ų�ѯ��Ʒ��Ϣ
	 * 
	 * @return
	 */
	public static productInfo selectProductByID(int productid) {
		String sql = "select * from product where deleted = 0 and id="
				+ productid;
		try {
			ResultSet rs = H2Conn.getStmt().executeQuery(sql);
			if (rs.next()) {
				return new productInfo(rs.getInt("id"), rs.getString("name"),
						rs.getString("po"),rs.getString("status"),rs.getString("createdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
