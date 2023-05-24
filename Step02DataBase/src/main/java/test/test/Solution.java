package test.test;

//코드 처리하기 문제(12점)
public class Solution {
	//code는 알파벳 소문자 또는 "1"로 이루어진 문자열
	public static String solution(String code) {
        String answer = "";
        String ret = "";
    	int mode = 0;
        for(int i = 0; i < code.length(); i++) {
        	
        	char ch = code.charAt(i);
        	if(mode == 0) {
        		
        		if(ch != '1') {
        			if(i%2 == 0) {
        				ret += ch;
        			}
        		} else if(ch == '1') {
        			mode = 1;
        		}
        	} 
        	if (mode == 1) {
        		if(ch != '1') {
        			if(i%2 == 1) {
        				ret += ch;
        			}
        		} else if(ch == '1') {
        			mode = 0;
        		}
        	}
        }
        if(ret != "") {
        	answer = ret;
        } else {
        	answer = "EMPTY";
        }
        
        return answer;
    }
	
	public static void main(String[] args) {
		String result = solution("abb11bd11dedf");
		System.out.println(result);
	}
}
