package com.test;

import java.util.List;

import com.dao.projectPerYearDAO;
import com.model.personYearInfo;

public class projectPerYearTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		List<personYearInfo> list = projectPerYearDAO.selectTop5ConsumedByProductID(6, 2015);
//		for(personYearInfo p : list)
//			System.out.println(p.getAccount()+p.getConsume());
		String name = projectPerYearDAO.selectTasknameByConsume("zhang.tao", 2015, 100.0);
		System.out.println(name);
	}

}
