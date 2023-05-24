package test.test;

//주사위 게임
public class Solution03 {
	public static int solution(int a, int b, int c) {
	        int answer = 0;
	        int result1 = a + b + c;
	        int result2 = ((int)Math.pow(a, 2)+(int)Math.pow(b, 2)+(int)Math.pow(c, 2));
	        int result3 = ((int)Math.pow(a, 3)+(int)Math.pow(b, 3)+(int)Math.pow(c, 3));
	        if(a != b && b != c && a != c) {
	        	answer = result1;
	        } else if(a == b && b != c ||
	        		  a == c && a != b ||
	        		  b == c && b != a) {
	        	answer = result1*result2;
	        } else if(a == b && b == c) {
	        	answer = result1*result2*result3;
	        }
	        return answer;
	}
	
	public static void main(String[] args) {
		int a = solution(4,4,4);
		System.out.println(a);
	}
}
