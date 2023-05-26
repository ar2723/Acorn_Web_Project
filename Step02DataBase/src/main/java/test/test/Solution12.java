package test.test;

public class Solution12 {
	 public static String solution(String my_string, int[][] queries) {
	        String answer = "";
	        String result = my_string;
	        StringBuilder sb = new StringBuilder(result);
	        for(int i =0; i < queries.length; i++) {
	        	char a = result.charAt(queries[i][0]);
	        	char b = result.charAt(queries[i][1]);
	      
	        	sb.setCharAt(queries[i][0], b);
	        	sb.setCharAt(queries[i][1], a);
	        	result = sb.toString();
	        }
	        answer = result;
	        return answer;
	    }
	 public static void main(String[] args) {
		 int[][] queries = {{2, 3}, {0, 7}, {5, 9}, {6, 10}};
		 String msg = solution("rermgorpsam", queries);
		 System.out.println(msg);
	}
}
