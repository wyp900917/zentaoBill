package com.test;

import java.util.List;

import net.sf.json.JSONArray;

import com.dao.userInfoDAO;
import com.model.userInfo;

public class userInfoTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<userInfo> list = userInfoDAO.selectAllUser();
		for(userInfo u : list) {
			JSONArray.fromObject(u).toString();
			System.out.println(JSONArray.fromObject(u).toString());
			System.out.println(u.getAccount()+"----"+u.getRealname());
		}
	}

}
