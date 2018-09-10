package com.universalbank.cardtoolbox.util;

import java.util.Random;

public class Util {

	public static final String[] FRANCHISE = {"Dinners Club","Visa","Master Card", "American Express"};
	/**
	 * 
	 * @param length
	 * @return
	 */
	public static String randomChar(int length) {
		Random r = new Random();
		char[] characters = new char[length];
		for(int i=0; i<length; i++) {
			characters[i] = (char)(r.nextInt(10) + '0');
		}		
		return String.copyValueOf(characters);
	}
	
	/**
	 * 
	 * @return
	 */
	public static String generateFranchise() {
		int num = (int)(Math.random() * 3);
		return Util.FRANCHISE[num];
	}
	
	/**
	 * 
	 * @param s
	 * @param n
	 * @return
	 */
	public static String padLeft(String s, int n) {
	    return String.format("%1$" + n + "s", s); 
	}
}
