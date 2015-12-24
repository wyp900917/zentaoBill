package com.test;

import java.util.List;

import com.dao.taskPerMonthDAO;
import com.model.taskConsumedInfo;

public class taskPerMonthTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<taskConsumedInfo> list = taskPerMonthDAO.selectTop3PerMonth(45, "2015-10");
		for(taskConsumedInfo t: list) {
			System.out.println(t.getTaskname()+"---"+t.getConsume());
		}
	}

}
