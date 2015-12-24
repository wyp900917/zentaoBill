package com.test;


import java.util.List;

import com.dao.projectInfoDAO;
import com.model.projectInfo;
import com.model.projectYearInfo;

public class projectInfoTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<projectYearInfo> list = projectInfoDAO.selectTop5ByProductID(4,2015);
		for (projectYearInfo u : list) {
			System.out.println(u.getId() + "-----" + u.getConsume());
		}
//		double u = projectInfoDAO.getConsumeBydate(12, 2015, 7);
//		System.out.println(u);
	}

}
