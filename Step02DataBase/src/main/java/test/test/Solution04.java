package test.test;

//수열과 구간쿼리4 (6점)
public class Solution04 {
	public static int[] solution(int[] arr, int[][] queries) {
		int[] answer = {};
		int[] result = new int [arr.length];
		for(int i = 0; i < queries.length; i++) {
			for(int j = 0; j < arr.length; j++) {
				if(j >= queries[i][0] && j <= queries[i][1]) {
					if(j % queries[i][2] == 0) {
						arr[j] += 1;
					}
				}
				result[j] = arr[j];
			}
		}
		answer = result;
		return answer;
	}
	
	public static void main(String[] args) {
		
	}
}
