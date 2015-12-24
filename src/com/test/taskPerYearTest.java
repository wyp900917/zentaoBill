package com.test;

import java.util.List;

import com.dao.taskPerYearDAO;
import com.model.taskDateInfo;

public class taskPerYearTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<taskDateInfo> list = taskPerYearDAO.selectTopPerYear("wang.yaping", "2015");
		for(taskDateInfo t: list) {
			System.out.println(t.getTaskname()+"---"+t.getConsume());
		}
	}

}
