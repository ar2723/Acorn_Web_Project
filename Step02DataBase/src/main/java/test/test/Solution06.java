package test.test;

public class Solution06 {
	public int[] solution(int start, int end) {
		int[] answer = {};
		answer = new int[end-start+1];
		int index = 0;
		
		for(int i = start; i <= end; i++) {
			answer[index] = i;
			index++;
		}
		return answer;
	}
}
