package com.kosmo.travary.model;

public class CustomUtility {

	public static int getRandomInt(int start,int end) {
		return (int)(Math.random()*(end-start+1)+start);
	}
}
