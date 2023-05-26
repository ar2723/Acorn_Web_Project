package test.test;

public class Solution10 {
	 public int solution(int a, int b, int c, int d) {
	        int answer = 0;
	        if(a == b && b == c && c == d) {
	        	answer = 1111*a;
	        } else if (a == b && b == c ||
	        		   a == b && b == d ||
	        		   a == c && c == d ||
	        		   b == c && c == d ) {
	        	
	        } else if (a == b || b == c || c == d || d == a) {
	        	
	        } else if (a !=b || b != c || c != d || d != a) {
	        	
	        }
	        return answer;
	    }
}
