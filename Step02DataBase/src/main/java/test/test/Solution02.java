package test.test;

//수열과 구간쿼리★★★★★ (9점)
public class Solution02 {
	public static int[] solution(int[] arr, int[][] queries) {
		int[] answer = {};
		int[] result = new int[queries.length];
		for(int i = 0; i < queries.length; i++) {
			int min = Integer.MAX_VALUE;
			for(int j = 0; j < arr.length; j++) {
	        	if(queries[i][0] <= j && queries[i][1] >= j) {
	        		if(arr[j] > queries[i][2] && min > arr[j]) {
		        		min = arr[j];
		        	}
	        	}
	        }
	        if(min == Integer.MAX_VALUE) {
	        		result[i] = -1;
	        } else {
	        		result[i] = min;
	        }
		}
		answer = result;
		return answer;
	}
	
	public static void main(String[] args) {
		
	}
}
