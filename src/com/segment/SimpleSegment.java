package com.segment;

import java.util.ArrayList;
import java.util.List;

public class SimpleSegment {

	
	public static void main(String[] args) {
		String str = "�Ұ�����л����񹲺͹����ͥ";
		List<String> normalDict = new ArrayList<String>();
		
		normalDict.add("");
		normalDict.add("��");
		normalDict.add("�л�");
		normalDict.add("���");
		normalDict.add("�л����񹲺͹�");
		
		int strLen = str.length();
		int j = 0;
		String matchWord = "";
		int matchPos = 0;
		
		while(j<strLen) {
			int matchPosTmp = 0;
			int i = 1;
			while(matchPosTmp < strLen) {
				matchPosTmp = i+j;
				String keyTmp = str.substring(j, matchPosTmp);
				if(normalDict.contains(keyTmp)) {
					matchWord = keyTmp;
					matchPos = matchPosTmp;
				}
				i++;
			}
			if(!matchWord.isEmpty()) {
				j = matchPos;
				System.out.print(matchWord + " ");
			} else {
				System.out.print(str.substring(j, ++j) + " ");
			}
			matchWord = "";
		}
	}
}
