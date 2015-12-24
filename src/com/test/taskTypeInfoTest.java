package com.test;

import java.util.List;

import net.sf.json.JSONArray;

import com.dao.taskTypeInfoDAO;
import com.model.taskTypeInfo;

public class taskTypeInfoTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<taskTypeInfo> list = taskTypeInfoDAO.selectTaskType("wang.yaping", "2015");
		System.out.println(JSONArray.fromObject(list).toString());
		for(taskTypeInfo u : list) {
			System.out.println(u.getName()+"----"+u.getValue());
		}
	}

}
