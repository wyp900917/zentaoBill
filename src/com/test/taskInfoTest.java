package com.test;

import com.dao.taskInfoDAO;

public class taskInfoTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		List<taskTypeInfo> list = taskInfoDAO.selectTaskType(14);
//		for (taskTypeInfo u : list) {
//			System.out.println(u.getName()+u.getValue());
//		}
		System.out.println(taskInfoDAO.selectTop1Task(46));
	}

}
