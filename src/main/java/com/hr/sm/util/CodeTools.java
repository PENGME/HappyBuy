package com.hr.sm.util;

import java.util.Random;

public class CodeTools {
		char[] charPool=new char[10+26+26];
		
		public void createChar(){
			for(int i=48,index=0;i<=122;i++){
				if(i>57 && i<65 || i>90 && i<97){
					continue;
				}
				//System.out.println((char)i);
				charPool[index]=(char)i;
				index++;
			}
		}
		
		
		public String getValidateCode(){
			this.createChar();
			StringBuffer sb=new StringBuffer();
			
			Random rd=new Random();
			
			for(int i=0;i<4;i++){
				int index=rd.nextInt(charPool.length);//62 0~61 
				char c=charPool[index];
//				System.out.print(c);
				sb.append(c);
			}
			return sb.toString();
		}
		
		public static void main(String[] args) {

			CodeTools ct=new CodeTools();
			ct.createChar();
			System.out.println(ct.getValidateCode());
		}
}
